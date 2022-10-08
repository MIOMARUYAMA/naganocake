class Customer < ApplicationRecord
  has_many :orders
  has_many :cart_items
  has_many :addresses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def only_address
  '〒' + postal_code + ' ' + address
  end
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + last_name + first_name
  end

  def full_name
   last_name + first_name
  end

end
