class OrdersController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy, :update]
  before_action :correct_user,   only: :destroy

  def index
    @orders = Order.all
  end

  def show 
    @order = Order.find_by(params[:id])
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      flash[:success] = "Order Posted!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end

  end

  def update
    @feed_item = Order.find(params[:id])
    if !@feed_item.update(params[:driver_id] == !nil)
      flash[:error] = "Sorry. Order already running."
      redirect_to root_path and return
    end
    if @feed_item.update(order_params)
      if @feed_item.running && !@feed_item.done
      flash[:success] = "Order Running!"
      redirect_to running_path 
      end
      if !@feed_item.running
      flash[:error] = "Order stopped!"
      redirect_to running_path
      end
      if @feed_item.done
      flash[:success] = "Order Done!"
      redirect_to done_path
      end
    end
  end

  def destroy
    @order.destroy
    redirect_to root_url
  end
  

  private
  
    def order_params
      params.require(:order).permit(:address, :phone, :surcharge, :user_id, :pay_type, :driver_id, :receipt, :redeemed)
    end

    def correct_user
      @order = current_user.orders.find_by(id: params[:id])
      redirect_to root_url if @order.nil?
    end
end
