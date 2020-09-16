module CartsHelper
  def total_price
    cart_details.to_a.sum { |product| product.total_price }
    
  end
  
end
