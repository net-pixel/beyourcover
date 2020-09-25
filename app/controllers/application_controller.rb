class ApplicationController < ActionController::Base
  helper_method :is_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :first_name, :last_name, :first_kana, :last_kana ])
  end

  def production?
    Rails.env.production?
  end


  private

  def current_cart
    current_cart = Cart.find_by(id: session[:cart_id])
    current_cart = Cart.create unless current_cart
    session[:cart_id] = current_cart.id
    current_cart
  end

  def is_admin!
    if current_user && current_user.admin
    else
        redirect_to root_path
    end
end
end
