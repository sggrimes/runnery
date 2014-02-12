class StaticPagesController < ApplicationController

  def home
  	if signed_in?
      @order  = current_user.orders.build
      @user = User.find_by(params[:id])
      @feed_items = current_user.restaurant_wait.paginate(page: params[:page], :per_page => 3)
      if driver?
      @feed_items = current_user.driver_wait.paginate(page: params[:page], :per_page => 3)
     
      @lat = request.location.latitude
      @long = request.location.longitude
      @locations = @feed_items.near([@lat, @long], 1)

      @hash = Gmaps4rails.build_markers(@feed_items) do |feed_item, marker|
        
        marker.lat feed_item.origin_latitude
        marker.lng feed_item.origin_longitude
        marker.infowindow feed_item.origin_address

        end
      end
    end
  end

  def site_info
  end
end


