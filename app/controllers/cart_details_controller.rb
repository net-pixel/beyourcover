class CartDetailsController < ApplicationController
  before_action :set_cart_detail, only: [:update, :destroy]

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @cart_detail = @cart.add_product(product)

    respond_to do |format|
      if @cart_detail.save
        #cars/:idに遷移する
        format.html { redirect_to @cart_detail.cart, notice: 'カートに商品が追加されました。' }
        format.json { render :show, status: :created, location: @cart_detail }
      else
        format.html { render :new }
        format.json { render json: @cart_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart_detail.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end
  

  def destroy
    # @cart = Cart.find(session[:cart.id])
    @cart_detail.destroy
    redirect_to current_cart
  end

  private
  def set_cart_detail
    @cart_detail = CartDetail.find(params[:id])
  end

  def cart_detail_params
    params.require(:cart_detail).permit(:product_id)
  end
end
