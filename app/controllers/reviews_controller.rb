class ReviewsController < ApplicationController

  def new
    @order = Order.find(params[:order_id])
    @driver = @order.driver
    @user = @order.user
    @review = Review.new
    authorize @review
  end

  def create
    @order = Order.find(params[:order_id])
    @driver = @order.driver
    @user = @order.user
    @review = Review.new(review_params)
    @review.driver = @driver
    @review.user = @user
    @review.order = @order
    authorize @review

    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  def blank_star
    @review = 5 - rating.to_i
    authorize @review
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy
  end


  private

  def review_params
    params.require(:review).permit(:rating, :decription, :user_id, :driver_id, :name)
  end


end
