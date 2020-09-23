class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product


  def self.adjustStock_createDetail(order, cart_details)
    cart_details.target.each do |cart_detail|
      OrderDetail.create!(
        order_id: order.id, product_id: cart_detail[:product_id], quantity: cart_detail[:quantity]
      )
      @product = Product.find_by(id: cart_detail[:product_id])
      @product.with_lock do
        @product.update(stock: (@product.stock - cart_detail[:quantity]))
      end
      CartDetail.find(cart_detail[:id]).delete
    end
  end

  def total_price
    product.price * quantity
  end
end
