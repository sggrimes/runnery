class DeliveriesController < ApplicationController
  before_action :signed_in_user

  def create
    @user = User.find(params[:delivery][:running_id])
    current_user.run!(@user)
    redirect_to @user
  end

  def destroy
    @user = Delivery.find(params[:id]).running
    current_user.stop_run!(@user)
    redirect_to @user
  end
end