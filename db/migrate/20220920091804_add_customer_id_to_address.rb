class AddCustomerIdToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :CustomerId, :integer
  end
end
