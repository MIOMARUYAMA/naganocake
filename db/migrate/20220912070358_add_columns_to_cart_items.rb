class AddColumnsToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :item_id, :integer, null: false, default: ""
    add_column :cart_items, :customer_id, :integer, null: false, default: ""
  end
end
