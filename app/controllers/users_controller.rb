class UsersController < ApplicationController
  #before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @orders = @user.orders.paginate(page: params[:page], :per_page => 10)
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
    end
 end

 def done_today
  @user = User.find_by(params[:id])
   if driver?
    @feed_items = current_user.driver_done.paginate(page: params[:page], :per_page => 10).reorder("created_at DESC")
    else
    @feed_items = current_user.restaurant_done.paginate(page: params[:page], :per_page => 10).reorder("created_at DESC")
   end

    @hash = Gmaps4rails.build_markers(@feed_items) do |feed_item, marker|
        marker.lat feed_item.latitude
        marker.lng feed_item.longitude
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

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
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

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Register updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url

    #respond_to do |format|
      #format.json { head :no_content }
    #end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_user
     #@user = User.find(params[:id])
   #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :phone, :address, :user_type, :latitude, :longitude, :password, :password_confirmation)
    end


     def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
