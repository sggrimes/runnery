class StaticPagesController < ApplicationController

  def home
  	if signed_in?
      @order  = current_user.orders.build
      @user = User.find_by(params[:id])
      @feed_items = current_user.restaurant_wait.paginate(page: params[:page], :per_page => 3)
      if driver?
      @feed_items = current_user.driver_wait.paginate(page: params[:page], :per_page => 3)
      end
    end
  end

  def help
  end

  def about
  end
end


