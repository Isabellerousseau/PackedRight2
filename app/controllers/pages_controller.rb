class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    set_markers
    @greet = greet

    if current_user
      @photo = current_user.photo.attached? ? current_user.photo.key : "no_avatar_qvedi0"
    else
      @photo = "no_avatar_qvedi0"
    end
  end

  def greet
    if Time.now.between? Time.now.beginning_of_day, Time.now.middle_of_day
      return "Good Morning"
    elsif Time.now.between? Time.now.middle_of_day, Time.now.change(hour: 17)
      return "Good Afternoon"
    elsif Time.now.between? Time.now.change(hour: 17), Time.now.change(hour: 20)
      return "Good Evening"
    elsif Time.now.between? Time.now.change(hour: 20), Time.now.end_of_day
      return "Good Night"
    end
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
