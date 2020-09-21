class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product


  def self.adjustStock_createDetail(order, cart_details)
    cart_details.target.each do |product|
      OrderDetail.create!(
        order_id: order.id, product_id: product[:product_id], quantity: product[:quantity]
      )
      @product = Product.find_by(id: product[:product_id])
      @product.update(stock: (@product.stock - product[:quantity]))
      CartDetail.find(product[:id]).delete
    end
  end

  def total_price
    product.price * quantity
  end
end
