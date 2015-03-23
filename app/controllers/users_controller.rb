class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: [:index, :destroy]

  def index
    @users = User.paginate(page: params[:page])
    @user = User.find_by(params[:id])
    if !@user.admin = true
      redirect_to root_url
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def running
    @user = User.find_by(params[:id])
    @order  = current_user.orders.build

    if driver?
    @feed_items = current_user.driver_run
    else
    @feed_items = current_user.restaurant_run
    end
    
    @hash = Gmaps4rails.build_markers(@feed_items) do |feed_item, marker|
      
        marker.lat feed_item.latitude
        marker.lng feed_item.longitude
        marker.infowindow render_to_string(partial: '/shared/feed_item',
          collection: @feed_items.select{|feed_items| feed_items.address == feed_item.address})
    end
  end

  def done_today
    @user = User.find_by(params[:id])

    if driver?
      @feed_items = current_user.driver_done.reorder("created_at DESC")
    else
      @feed_items = current_user.restaurant_done.reorder("created_at DESC")
    end

    @hash = Gmaps4rails.build_markers(@feed_items) do |feed_item, marker|
        marker.lat feed_item.latitude
        marker.lng feed_item.longitude
        marker.infowindow render_to_string(partial: '/shared/feed_item',
          collection: @feed_items.select{|feed_items| feed_items.address == feed_item.address})
    end
  end

  def all_done
  @user = User.find_by(params[:id])

   if driver?
    @feed_items = current_user.driver_all_done.reorder("created_at DESC")
   else
    @feed_items = current_user.restaurant_all_done.reorder("created_at DESC")
   end
   
  end

  def pickups
    if signed_in? && driver?
      @user = User.find_by(params[:id])
      @feed_items = current_user.driver_run

        @hash = Gmaps4rails.build_markers(@feed_items) do |feed_item, marker|
      
          marker.lat feed_item.origin_latitude
          marker.lng feed_item.origin_longitude
          marker.infowindow render_to_string(partial: '/shared/feed_item',
          collection: @feed_items.select{|feed_items| feed_items.origin_address == feed_item.origin_address})

        
      end
    end
  end

  def dropoffs
    if signed_in?
      @user = User.find_by(params[:id])
      if driver?
       @feed_items = current_user.driver_run
      else
       @feed_items = current_user.restaurant_run
      end

        @hash = Gmaps4rails.build_markers(@feed_items) do |feed_item, marker|
      
          marker.lat feed_item.latitude
          marker.lng feed_item.longitude
         marker.infowindow render_to_string(partial: '/shared/feed_item',
          collection: @feed_items.select{|feed_items| feed_items.address == feed_item.address})

        
      end
    end
  end

  def dropoffs_done
     @user = User.find_by(params[:id])

    if driver?
      @feed_items = current_user.driver_done.paginate(page: params[:page], :per_page => 3).reorder("created_at DESC")
    else
      @feed_items = current_user.restaurant_done.paginate(page: params[:page], :per_page => 3).reorder("created_at DESC")
    end

    @hash = Gmaps4rails.build_markers(@feed_items) do |feed_item, marker|
        marker.lat feed_item.latitude
        marker.lng feed_item.longitude
        marker.infowindow feed_item.address
    end
  end

  def pickups_done
     @user = User.find_by(params[:id])

    if driver?
      @feed_items = current_user.driver_done.paginate(page: params[:page], :per_page => 3).reorder("created_at DESC")
    else
      @feed_items = current_user.restaurant_done.paginate(page: params[:page], :per_page => 3).reorder("created_at DESC")
    end

    @hash = Gmaps4rails.build_markers(@feed_items) do |feed_item, marker|
        marker.lat feed_item.origin_latitude
        marker.lng feed_item.origin_longitude
        marker.infowindow feed_item.origin_address
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
   @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Runnery!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
     if @user.update_attributes(user_params)
     flash[:success] = "User Register Updated!"
     redirect_to @user
     else
     redirect_to edit_user_path
   end
  end

  def destroy
    @user = User.find(params[:id])
    User.find(params[:id]).destroy
    flash[:error] = "User deleted."
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :phone, :address, :user_type, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
