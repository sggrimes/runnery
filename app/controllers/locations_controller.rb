class LocationsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    redirect_to root_path
  end

  def update
    @location = Location.find_by(params[:id])
    @location.update_attributes(location_params)
    redirect_to root_path
  end

  def destroy
  end

   private

    def location_params
      params.require(:location).permit(:lat, :long, :user_id) if params[:location]
    end
end
