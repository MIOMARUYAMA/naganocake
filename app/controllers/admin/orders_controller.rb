class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details

  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order_details = @order.order_details

    if @order.order_status == "payment_confirmation"
      @order_details.each do |order_detail|
        order_detail.update(process: "production_pending")
      end
    end
      redirect_to admin_order_path
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end


end
