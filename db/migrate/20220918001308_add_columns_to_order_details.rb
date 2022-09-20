class AddColumnsToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :item_id, :integer, null: false, default: ""
    add_column :order_details, :order_id, :integer, null: false, default: ""
  end
end
