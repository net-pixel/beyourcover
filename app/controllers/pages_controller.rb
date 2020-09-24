class PagesController < ApplicationController
  before_action :set_cart

  def about
    if user_signed_in?
      @user = User.find(current_user.id)
      @address = Address.find(current_user.id)
    end
  end

  def search
    @search = Product.ransack(params[:q])
    @products = @search.result
  end

  def search_result
    @search = Product.ransack(params[:q])
    @products = @search.result
  end

  def privacy
    if user_signed_in?
      @user = User.find(current_user.id)
      @address = Address.find(current_user.id)
    end
  end

  def faq
    if user_signed_in?
      @user = User.find(current_user.id)
      @address = Address.find(current_user.id)
    end
  end

  def delivery
    if user_signed_in?
      @user = User.find(current_user.id)
      @address = Address.find(current_user.id)
    end
  end

  def refund
    if user_signed_in?
      @user = User.find(current_user.id)
      @address = Address.find(current_user.id)
    end
  end

  def terms_of_service
    if user_signed_in?
      @user = User.find(current_user.id)
      @address = Address.find(current_user.id)
    end
  end

  def tokushoho
    if user_signed_in?
      @user = User.find(current_user.id)
      @address = Address.find(current_user.id)
    end
  end

  def inquiry
    if user_signed_in?
      @user = User.find(current_user.id)
      @address = Address.find(current_user.id)
    end
  end

  private
  def set_cart
    @cart = current_cart
  end
end
