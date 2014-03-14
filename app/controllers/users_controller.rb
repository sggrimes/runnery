class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def running
    @user = User.find_by(params[:id])

    if driver?
    @feed_items = current_user.driver_run.paginate(page: params[:page], :per_page => 3)
    else
    @feed_items = current_user.restaurant_run.paginate(page: params[:page], :per_page => 3)
    end
    
    @hash = Gmaps4rails.build_markers(@feed_items) do |feed_item, marker|
      
        marker.lat feed_item.latitude
        marker.lng feed_item.longitude
        marker.infowindow feed_item.address
    end
  end

  def done_today
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

  def all_done
  @user = User.find_by(params[:id])

   if driver?
    @feed_items = current_user.driver_all_done.paginate(page: params[:page], :per_page => 10).reorder("created_at DESC")
   else
    @feed_items = current_user.restaurant_all_done.paginate(page: params[:page], :per_page => 10).reorder("created_at DESC")
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
      redirect_to root_url
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
     if @user.update(user_params)
     flash[:success] = "User Register Updated!"
     redirect_to @user
     else
     redirect_to edit_user_path
   end
  end

  def destroy
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
