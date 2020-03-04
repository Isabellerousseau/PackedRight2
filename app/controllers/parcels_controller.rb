# frozen_string_literal: true

class ParcelsController < ApplicationController
  def index
    @parcels = policy_scope(Parcel).order(created_at: :desc)
  end

  def show
    @parcel = Parcel.find(params[:id])
    authorize @parcel
  end

  def new
    @parcel = Parcel.new
    authorize @parcel
  end

  def create
    @parcel = Parcel.new(parcel_params)
    @parcel.user = current_user
    authorize @parcel
    if @parcel.save
      redirect_to parcel_path(@parcel)
    else
      render :new
    end
  end

  def edit
    @parcel = Parcel.find(params[:id])
    authorize @parcel
  end

  def update
    @parcel = Parcel.find(params[:id])
    @parcel.update(parcel_params)
    authorize @parcel
    redirect_to parcels_path
  end

  def destroy
    @parcel = Parcel.find(params[:id])
    authorize @parcel
    @parcel.destroy
    redirect_to parcels_path
  end

  def my_products
    @parcels = current_user.parcels
    authorize @parcel
  end

  private

  def parcel_params
    params.require(:parcel).permit(:name, :weight, :category, :fragile)
  end
end
