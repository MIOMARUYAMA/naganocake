class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @cart_items = current_customer.cart_items
    @order=Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.price = cart_item.item.add_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.process = cart_item.amount
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def thanks
  end

  def confirm
    @cart_items = CartItem.all
    @order = Order.new(order_params)

    if params[:order][:address_option] == "0"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.full_name

    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.address = @address.address
      @order.postal_code = @address.postal_code
      @order.name = @address.name

    elsif params[:order][:address_option] == "2"
      @address = Address.new
      @address.CustomerId = current_customer.id
      @address.address = @order.address
      @address.postal_code = @order.postal_code
      @address.name = @order.name
      @address.save
    end
  end

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details

  end

  private

    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name, :shipping_fee, :charge)
    end
    def order_detail_params
      params.require(:order_detail).permit(:order_id, :price)
    end

end
