class OrdersController < ApplicationController
  #before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:create, :destroy, :update]
  before_action :correct_user,   only: :destroy

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show 
    @order = Order.find_by(params[:id])
end


  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      flash[:success] = "Order Posted!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end

    #respond_to do |format|
     # if @order.save
      
      #  format.html { redirect_to @order, notice: 'Order was successfully created.' }
       # format.json { render action: 'show', status: :created, location: @order }
      #else
       # format.html { render action: 'new' }
        #format.json { render json: @order.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @feed_item = Order.find(params[:id])
    if !@feed_item.running
     if @feed_item.update(order_params)
        flash[:success] = "Order Running!"
      redirect_to running_path
    end
    else
      if @feed_item.update(order_params)
        flash[:success] = "Order Done!"
      redirect_to done_path
    end
  end
end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    redirect_to root_url
   # respond_to do |format|
      #format.html { redirect_to orders_url }
      #format.json { head :no_content }
    #end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_order
      #@order = Order.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :phone, :surcharge, :user_id, :pay_type, :driver_id, :receipt, :redeemed)
    end

    def correct_user
      @order = current_user.orders.find_by(id: params[:id])
      redirect_to root_url if @order.nil?
    end
end
