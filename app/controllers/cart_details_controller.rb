class CartDetailsController < ApplicationController
  before_action :set_cart_detail, only: [:update, :destroy]

  def update
    @cart_detail.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end
  

  def destroy
    @cart_detail.destroy
    redirect_to current_cart
  end

  private
  def set_cart_detail
    @cart_detail = CartDetail.find_by(params[:id])
  end

  def cart_detail_params
    params.require(:cart_detail).permit(:product_id, :cart_id)
  end
end
