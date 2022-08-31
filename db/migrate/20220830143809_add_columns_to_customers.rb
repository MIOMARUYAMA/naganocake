class AddColumnsToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :last_name, :string, null: false, default: ""
    add_column :customers, :first_name, :string, null: false, default: ""
    add_column :customers, :last_name_kana, :string, null: false, default: ""
    add_column :customers, :first_name_kana, :string, null: false, default: ""
    add_column :customers, :postal_code, :string, null: false, default: ""
    add_column :customers, :address, :string, null: false, default: ""
    add_column :customers, :telephone_number, :string, null: false, default: ""
    add_column :customers, :is_active, :boolean, null: false, default: true
  end
end
