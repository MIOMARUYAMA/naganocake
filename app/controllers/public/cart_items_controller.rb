class Public::CartItemsController < ApplicationController
  def index
    @cart_items=CartItem.all
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item=CartItem.new(cart_item_params)
    @cart_item.customer_id=current_customer.id
    if current_customer.cart_items.find_by(item_id: cart_item_params[:item_id]).present?
      cart_item=current_customer.cart_items.find_by(item_id: cart_item_params[:item_id])
      cart_item.amount = cart_item.amount + cart_item_params[:amount].to_i
      cart_item.save
      redirect_to cart_items_index_path
    else
      @cart_item.save
      redirect_to cart_items_index_path
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
