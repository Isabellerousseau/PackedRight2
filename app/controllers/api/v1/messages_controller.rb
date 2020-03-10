class Api::V1::MessagesController < Api::V1::ApiController
  def index
    @order = Order.find(params[:order_id])
    @messages = @order.messages
  end

  def create
    @message = Message.new(message_params)
    @order = Order.find(params[:order_id])

    @message.order_id = params[:order_id]

    if params[:is_driver]
      @message.messageable = @order.driver
    else
      @message.messageable = current_user
    end

    if @message.save!
      authorize @message
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
