class DriversController < ApplicationController
  def index
    @drivers = policy_scope(Driver).order(created_at: :desc)

    @drivers = @drivers.geocoded
    set_markers
  end

  def show
    @driver = policy_scope(Driver).find(params[:id])
    authorize @driver
  end

  def new
    driver = Driver.find_or_create_by!(user_id: current_user.id)
    authorize driver
    redirect_to edit_driver_path(driver)
  end

  def create
    @driver = Driver.new(driver_params)
    authorize @driver

    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def edit
    @driver = policy_scope(Driver).find(params[:id])
    authorize @driver
  end

  def update
    @driver = policy_scope(Driver).find(params[:id])
    @driver.update(driver_params)
    authorize @driver
    redirect_to drivers_path
  end

  def destroy
    @driver = policy_scope(Driver).find(params[:id])
    authorize @driver
    @driver.destroy
    redirect_to parcels_path
  end

  def categories
    @category = params[:category].capitalize
    @drivers = Driver.where('category ILIKE ?', "%#{@category}%")
    @drivers = @drivers.geocoded #returns flats with coordinates
    set_markers
    authorize @drivers
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :email, :phone_number, :address, :password)
  end

  def set_markers
    @drivers = policy_scope(Driver)
    @markers = @drivers.map do |driver|
      {
        lat: driver.latitude,
        lng: driver.longitude,
        infoWindow: render_to_string(partial: "drivers/info_window", locals: { driver: driver }),
        image_url: helpers.asset_url('car.png')
      }
    end
  end
end
