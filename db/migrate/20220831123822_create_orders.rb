class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.string :name, null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.string :address, null: false, default: ""
      t.integer :shipping_fee, null: false, default: ""
      t.integer :charge, null: false, default: ""
      t.integer :payment_method, null: false, default: 0
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
