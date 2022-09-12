class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items

  def get_image(width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  def  add_tax_price
  (self.price * 1.10).round
  end
end
