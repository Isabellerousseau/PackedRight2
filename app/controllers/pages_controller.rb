class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    set_markers
  end

  def set_markers
    @drivers = policy_scope(Driver)
    @markers = @drivers.map do |driver|
      {
        lat: driver.latitude,
        lng: driver.longitude,
        infoWindow: render_to_string(partial: "drivers/info_window", locals: { driver: driver }),
        image_url:
        if driver.category == 'Car'
          helpers.asset_url('car.png')
        elsif driver.category == 'Bike'
          helpers.asset_url('bike.png')
        else
          helpers.asset_url('bus.png')
        end
      }
    end
  end
end
