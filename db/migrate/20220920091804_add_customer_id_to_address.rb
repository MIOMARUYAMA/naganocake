class AddCustomerIdToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :customer_id, :integer
  end
end
