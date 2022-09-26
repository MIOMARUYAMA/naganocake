class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)

    if @order_details.where(process: "in_production").count == 1
      @order.update(order_status: "in_production")

    elsif @order_details.count == @order_details.where(process: "production_complete").count
      @order.update(order_status: "preparing_delivery")
    end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:process)
  end

end
