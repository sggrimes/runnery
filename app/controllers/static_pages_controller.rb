class StaticPagesController < ApplicationController

  def home
  	if signed_in?

      @order  = current_user.orders.build
      @user = User.find_by(params[:id])
      @feed_items = current_user.restaurant_wait
    
      if driver?
        if current_user.location.nil?
        @location = current_user.create_location(location_params)
        else
        @location = current_user.location
        @location.update_attributes(location_params)
        end

        @feed_items = current_user.driver_wait

        @hash = Gmaps4rails.build_markers(@feed_items) do |feed_item, marker|
        
        marker.lat feed_item.origin_latitude
        marker.lng feed_item.origin_longitude
        marker.infowindow render_to_string(partial: '/shared/feed_item',
          collection: @feed_items.select{|feed_items| feed_items.origin_address == feed_item.origin_address})
    
        end
      else
        
        @hash = Gmaps4rails.build_markers(@feed_items) do |feed_item, marker|
      
        marker.lat feed_item.latitude
        marker.lng feed_item.longitude
        marker.infowindow render_to_string(partial: '/shared/feed_item',
          collection: @feed_items.select{|feed_items| feed_items.address == feed_item.address})

        end
      end
    end
  end

  def pickups_wait
    if signed_in? && driver?
      @order  = current_user.orders.build
      @user = User.find_by(params[:id])
      @feed_items = current_user.driver_wait

        @hash = Gmaps4rails.build_markers(@feed_items) do |feed_item, marker|
      
          marker.lat feed_item.origin_latitude
          marker.lng feed_item.origin_longitude
          marker.infowindow render_to_string(partial: '/shared/feed_item',
          collection: @feed_items.select{|feed_items| feed_items.origin_address == feed_item.origin_address})

        
      end
    end
  end

  def dropoffs_wait
    if signed_in?
      @order  = current_user.orders.build
      @user = User.find_by(params[:id])
      if driver?
       @feed_items = current_user.driver_wait
      else
       @feed_items = current_user.restaurant_wait
      end

        @hash = Gmaps4rails.build_markers(@feed_items) do |feed_item, marker|
      
          marker.lat feed_item.latitude
          marker.lng feed_item.longitude
          marker.infowindow render_to_string(partial: '/shared/feed_item',
          collection: @feed_items.select{|feed_items| feed_items.address == feed_item.address})

      end
    end
  end

  def site_info
  end

  private

    def location_params
      params.require(:location).permit(:lat, :lng, :user_id) if params[:location]
    end
end


