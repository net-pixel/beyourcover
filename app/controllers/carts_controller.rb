class CartsController < ApplicationController
  before_action :set_cart_detail, only: [:add_product, :update_product, :destroy]
  before_action :set_user
  before_action :set_cart

  def show
    @cart_details = @cart.cart_details
  end

  def add_product
    @cart_detail = current_cart.cart_details.build(product_id: params[:product_id]) if @cart_detail.blank?
    @cart_detail.quantity += params[:quantity].to_i
    if @cart_detail.save!
      redirect_to current_cart
    else
      redirect_to controller: "products", action: "show"
    end
  end

  def update_product
    @cart_detail.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def destroy
    @cart_detail.destroy
    redirect_to current_cart
  end


  private

  def set_cart_detail
    @cart_detail = current_cart.cart_details.find_by(product_id: params[:product_id])
  end

  def set_user
    @user = current_user
  end

  def set_cart
    @cart = current_cart
  end
end
