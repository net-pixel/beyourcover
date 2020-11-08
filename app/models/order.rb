class Order < ApplicationRecord
  belongs_to :user
  has_many :products, through: :order_details
  has_many :order_details, dependent: :destroy
  belongs_to :card
  belongs_to :address

  # enum status: {支払済み: 0, 配送準備中: 1, 配送済み: 2}

end
