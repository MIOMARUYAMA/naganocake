class Public::ItemsController < ApplicationController
  def index
    @items=Item.page(params[:page]).per(4)
  end

  def show
    @item=Item.find(params[:id])
    @cart_item=CartItem.new
  end

    private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :is_active, :genre_id)
  end

end
