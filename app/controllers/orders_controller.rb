class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order).order(created_at: :desc)
  end

  def new
    @order = Order.new
    @order.build_parcel
    authorize @order
    driver_markers
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.category = @order.parcel.category
    @order.weight = @order.parcel.weight
    @order.fragile = @order.parcel.fragile
    authorize @order
    if @order.save
      redirect_to edit_order_path(@order)
    else
      p @order.errors
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
    authorize @order
    order_markers
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
    coord = Geocoder.search(@order.drop_off).first
    coord2 = Geocoder.search(@order.pickup).first
    @markers = [{
        lat: coord.latitude,
        lng: coord.longitude,
        image_url: helpers.asset_url('markergreen.png')
      },
       {
        lat: coord2.latitude,
        lng: coord2.longitude,
        image_url: helpers.asset_url('markerred.png')
      }]
      Driver.where(category: @order.category).each do |driver|
        @markers << { lat: driver.latitude,
          lng: driver.longitude,
          image_url:
            if driver.category == 'Car'
              helpers.asset_url('car.png')
            elsif driver.category == 'Bike'
              helpers.asset_url('bike.png')
            else
              helpers.asset_url('bus.png')
            end
        }
      end
  end

    def driver_markers
    @drivers = policy_scope(Driver)
    @markers = @drivers.map do |driver|
      {
        lat: driver.latitude,
        lng: driver.longitude,
        infoWindow: render_to_string(partial: "drivers/info_window", locals: { driver: driver }),

        image_url:
        if driver.category == 'Car'
          helpers.asset_url('car.png')
        elsif driver.category == 'Bike'
          helpers.asset_url('bike.png')
        else
          helpers.asset_url('bus.png')
        end
      }
      end
    end
end
