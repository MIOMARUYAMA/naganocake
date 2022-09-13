class Public::OrdersController < ApplicationController
  def new
  end

  def create
    @order=Order.new(order_params)
    @order.save
    redirect_to orders_confirm_path
  end

  def thanks
  end

  def confirm
  end

  def index
  end

  def show
  end
  
  private
  
    def order_params
      params.require(:order).permit(:payment_method, )
    end

end
