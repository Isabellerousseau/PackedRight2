class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{ params[:order_id] }"
  end
end
