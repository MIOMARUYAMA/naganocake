class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      
      t.string :name, null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.string :address, null: false, default: ""
      t.timestamps
    end
  end
end
