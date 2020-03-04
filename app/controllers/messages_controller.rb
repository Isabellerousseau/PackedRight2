class MessagesController < ApplicationController
 skip_after_action :verify_authorized

  def index

  end

  def new
    @message = Message.new
  end

  def create
    @message =Message.new(message_params)
    @message.user = current_user
    @order = Order.find(params[:order_id])
    @message.order = @order
    @driver = @order.driver
    @message.driver = @driver
    authorize @message
    if @message.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
