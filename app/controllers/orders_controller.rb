class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order).order(created_at: :desc)
  end

  def new
    @order = Order.new
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    authorize @order
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
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
    authorize @order
  end
end
