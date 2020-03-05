class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order).order(created_at: :desc)
  end

  def new
    @order = Order.new
    @order.build_parcel
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.category = @order.parcel.category
    @order.weight = @order.parcel.weight
    @order.fragile = @order.parcel.fragile
    authorize @order
    if @order.save
      redirect_to order_path(@order)
    else
      p @order.errors
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
    authorize @order
  end

  def update
    @order = Order.find(params[:id])
    authorize @order
    @order.update(order_params)
    redirect_to root
  end

  def destroy
  @order = Order.find(params[:id])
  authorize @order
  @order.destroy
  # redirect_to root
  end

  def show
    @order = Order.find(params[:id])
    @message = Message.new
    authorize @order
  end

  private

  def order_params
    params.require(:order).permit(:pickup, :drop_off, :pickup_time, parcel_attributes: [:name, :weight, :category, :fragile])
  end

  def order_markers
    @orders = policy_scope(Order)
    @markers = @orders.map do |order|
      {
        lat: order.pickup.latitude,
        lng: order.drop_off.longitude,
        infoWindow: render_to_string(partial: "drivers/info_window", locals: { order: order }),
      }
    end
  end

end
