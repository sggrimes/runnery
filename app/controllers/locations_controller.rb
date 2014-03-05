class LocationsController < ApplicationController
  

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    current_user.create_location(location_params)
    redirect_to root_path
  end

  def update
     @location = current_user.location
     @location.update_attributes(location_params)
     redirect_to root_path
  end

   def destroy
    Location.find(params[:id]).destroy
    redirect_to root_url
   end

   private

    def location_params
      params.require(:location).permit(:lat, :lng, :user_id) if params[:location]
    end
end
