class DriverChannel < ApplicationCable::Channel
  def subscribed
    stream_from "driver_#{ params[:driver_id] }"
  end
end
