class DeliveriesController < ApplicationController
  def index
    @deliveries = policy_scope(Delivery).order(created_at: :desc)
  end

  def new
    @delivery = Delivery.new
    authorize @delivery
  end

  def edit
    @delivery = Delivery.find(params[:id])
    authorize @delivery
  end

  def show
    @delivery = Delivery.find(params[:id])
    authorize @delivery
  end
end
