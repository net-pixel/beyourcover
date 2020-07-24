class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_category, only: [:new, :edit, :create, :update, :destroy]

  def index
    @products = Product.includes(:images).order("created_at DESC")
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @images = Image.limit(3).order(id: "DESC")
  end

  def get_category_children
    @category_children = Category.find("#{params[:parent_name]}").children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def new
    @product = Product.new
    @product.images.new
  end


  def create
    @product = Product.new(product_params)
    if @product.save!
      return
    else
      @product.images.new
      render :new
    end
  end

  def edit
    if user_signed_in? && current_user.id == @product.user_id
      return
    else
      redirect_to product_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def show
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @images = @product.images
    @category = @product.category
    @parents = @category.root
    @children = @category.parent
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      redirect_to product_path
    end
  end

  private


  def set_product
    @product = Product.find(params[:id])
  end

  def set_category
    @category_parent_array = Category.where(ancestry: nil)
  end

  def product_params
    params.require(:product).permit(:name, :detail, :brand, :price, :category_id, :postage, :prefecture_id, :shipping_day, :buyer_id, images_attributes: [:item, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end
end
