class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  enum payment_method: { credit_card: 0, transfer: 1 }
    # 注文ステータス（0=入金待ち / 1=入金確認 / 2=制作中 / 3=発送準備中 / 4=発送済み）
  enum order_status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }

end
