class Api::V1::MessagesController < Api::V1::ApiController
  def index
    @order = Order.find(params[:order_id])
    @messages = @order.messages
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @order = Order.find(params[:order_id])
    @message.order = @order
    @driver = @order.driver
    @message.driver = @driver

    authorize @message

    if @message.save
      render :show, status: :created
    end
  end

  def destroy
    @message = Message.find(params[:id])
    authorize @message

    if @message.destroy
      head :no_content
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
