class DriverLocationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "driver_location_#{ params[:driver_id, :latitude, :longitude] }"
  end
end
