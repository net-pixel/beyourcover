class CategoriesController < ApplicationController
  before_action :set_category, only: :show
  before_action :set_cart

  def index
    @parents = Category.where(ancestry: nil)
    @products = Product.all
    @categories = Product.includes(:images).order("created_at DESC")
  end

  def show
    @parents = Category.where(ancestry: nil)
    if @category.has_children?
      @products = Product.includes(:images).order("created_at DESC").where(category_id: @category.descendants)
    else
      @products = Product.includes(:images).order("created_at DESC").where(category_id: @category)
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def set_cart
    @cart = current_cart
  end
end
