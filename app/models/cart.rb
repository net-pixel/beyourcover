class Cart < ApplicationRecord
  has_many :cart_details, dependent: :destroy

  def add_product(product_id)
    cart_details.find_or_initialize_by(product_id: product_id)
  end

  def add_quantity(quanitty)
    cart_details.find_or_initialize_by(quantity: quantity)
  end

  def total_price
    cart_details.to_a.sum{|product| product.total_price}
  end

  def total_number
    cart_details.to_a.sum{|product| product.quantity}
  end
end
