class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_details.update(order_detail_params)

    if @order_details.where(process: "2").count >= 1
      @order.order_status == "2"
      @order.save
    
    elsif @order_details.count == @order_details.where(process: 3).count
      @order.order_status == "3"
      @order.save
    end
    redirect_to admin_order_path
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:process)
  end

end
