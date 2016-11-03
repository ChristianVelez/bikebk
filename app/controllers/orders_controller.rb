class OrdersController < ApplicationController
  before_filter :authenticate_user!
  protect_from_forgery with: :null_session
    
  def index
    @orders = Order.all
    respond_with @orders
  end

  def show
    @order = Order.find(params[:id])
    respond_with @order
  end

  def new
  end

  def create
    @order = Order.create(order_params)
    respond_with @order
  end

  def destroy
    respond_with Order.destroy(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :user_id, :total)
  end

end