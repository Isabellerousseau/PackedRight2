class Api::V1::MessagesController < Api::V1::ApiController
  def index
    @order = Order.find(params[:order_id])
    @messages = @order.messages
  end
end
