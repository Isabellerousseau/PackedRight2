class Api::V1::DriversController < Api::V1::ApiController
  def update
    @driver = policy_scope(Driver).find(params[:id])
    @driver.update(driver_params)
    authorize @driver

    render :show
  end

  private

  def driver_params
    params.require(:driver).permit(:latitude, :longitude)
  end
end
