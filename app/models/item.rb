class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items
  has_many :order_details

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/tulip.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def  add_tax_price
  (self.price * 1.10).round
  end
end
