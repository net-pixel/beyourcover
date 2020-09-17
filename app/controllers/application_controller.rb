class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :first_name, :last_name, :first_kana, :last_kana ])
  end

  def production?
    Rails.env.production?
  end

  
  
  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  
  def current_cart
    current_cart = Cart.find_by(id: session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    current_cart = Cart.create unless current_cart
    session[:cart_id] = current_cart.id
    current_cart
  end
end
