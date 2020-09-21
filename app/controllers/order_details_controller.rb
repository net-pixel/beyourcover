class OrderDetailsController < ApplicationController
  before_action :set_cart
  before_action :set_user

  def index
    @orderDetails = OrderDetail.where(order_id: params[:order_id])
  end

  private
  def set_cart
    @cart = current_cart
  end

  def set_user
    @user = current_user
  end
end
