class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{ params[:order_id] }"
  end

  # Called when message-form contents are received by the server
  def send_message(payload)
    message = Message.new(
      user: current_user,
      content: payload["message"],
      driver_id: payload["driver_id"],
      order_id: payload["driver_id"]
    )

    ActionCable.server.broadcast "chat_#{message.order_id}", message: render(message) if message.save
  end

  private

  def render(message)
    ApplicationController.new.helpers.c("message", message: message)
  end
end
# class ChatChannel < ApplicationCable::Channel
#   # def subscribed
#   #   stream_from "chat"
#   # end

#   def subscribed
#     stream_from "room_#{params[:order]}"
#   end

#   def send_message(payload)
#     puts "/////////////////////////////////////"
#     puts payload.inspect

#     message = Message.new(
#       user: current_user,
#       driver_id: payload["driver_id"],
#       order_id: payload["order_id"],
#       content: payload["message"]
#     )

#     ActionCable.server.broadcast "chat", message: message if message.save
#   end

#   def unsubscribed
#     # Any cleanup needed when channel is unsubscribed
#   end
# end

# # class ChatChannel < ApplicationCable::Channel
# #   def subscribed
# #     stream_from "chat"
# #   end

# #   # Called when message-form contents are received by the server
# #   def send_message(payload)
# #     message = Message.new(author: current_user, text: payload["message"])

# #     ActionCable.server.broadcast "chat", message: render(message) if message.save
# #   end

# #   private

# #   def render(message)
# #     ApplicationController.new.helpers.c("message", message: message)
# #   end
# # end
