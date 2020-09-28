# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]　/デフォルト記載
  # before_action :configure_account_update_params, only: [:update]　/デフォルト記載
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :set_cart

  def new
    @user = User.new
  end

  def new_user
    @user = User.new
  end

  def create_user
    @user = User.create(sign_up_params)
    @address = Address.new
    resource.update(confirmed_at: Time .now.utc)
    if @user.valid?
      session["devise.regist_data"] = { user: @user.attributes }
      session["devise.regist_data"][:user]["password"] = params[:user][:password]
      session["devise.regist_data"][:user]["password_confirmation"] = params[:user][:password_confirmation]
      render :new_address
      return
    else
      render :new_user
    end
  end

  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(current_user.id)
    if current_user.update(user_params)
      bypass_sign_in(current_user)
      redirect_to root_path
    else
      return
    end
  end

  def new_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new
  end

  def create_address
    @user = User.create(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    if @address.valid?
      @user.save
      @address = Address.create(address_params.merge(user_id: @user.id))
      @address.save
      session["devise.regist_data"]["user"].clear
      # sign_in(:user, @user)
      bypass_sign_in(current_user)
      redirect_to root_path
    else
      render :new_address
      return
    end
  end
  
  def edit_address
    @address = Address.find(current_user.id)
  end
  
  def update_address
    @address = Address.find(current_user.id)
    @address.update(address_params)
    flash[:notice] = '住所情報を更新しました'
    redirect_to new_order_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer. /デフォルト記載
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :first_name, :last_name, :first_kana, :last_kana ])
  end

  def address_params
    params.require(:address).permit(:destination_first, :destination_last, :destination_first_kana, :destination_last_kana, :post_code, :prefecture_id, :city, :address, :building, :phone_number )
  end

  def set_cart
    @cart = current_cart
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def set_address
    @address = Address.find(current_user.id)
  end
end
