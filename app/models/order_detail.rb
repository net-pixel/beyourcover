class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product


  def self.adjustStock_createDetail(order, cart_details)
    cart_details.each do |cart_detail|
      OrderDetail.create!(
        order_id: order.id, product_id: cart_detail[:product_id], quantity: cart_detail[:quantity]
      )
      @product = Product.lock.find_by(id: cart_detail[:product_id])
      #プロダクトテーブルのストックとカートの製品数を比較しないといけない
      
      @product.update!(stock: (@product.stock - cart_detail[:quantity]))
      CartDetail.find(cart_detail[:id]).delete
    end
  end

  def total_price
    product.price * quantity
  end
end
