class OrdersController < ApplicationController
  before_action :set_cart
  before_action :user_signed_in
  before_action :set_user
  before_action :set_card
  before_action :set_address

  require "payjp"

  #注文入力画面
  def new
    @cart_details = current_cart.cart_details
    @cart = current_cart
    if @cart.cart_details.empty?
      redirect_to current_cart, notice: "カートは空です"
      return
    end
    if @card.present?
      customer = Payjp::Customer.retrieve(@card.customer_id)
      default_card_information = customer.cards.retrieve(@card.card_id)
      @card_info = customer.cards.retrieve(@card.card_id)
      @exp_month = default_card_information.exp_month.to_s
      @exp_year = default_card_information.exp_year.to_s.slice(2,3)
      customer_card = customer.cards.retrieve(@card.card_id)
      @card_brand = customer_card.brand
      case @card_brand
      when "Visa"
        @card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/visa.svg?238737266"
      when "MasterCard"
        @card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/master-card.svg?238737266"
      when "JCB"
        @card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/jcb.svg?238737266"
      when "American Express"
        @card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/american_express.svg?238737266"
      when "Diners Club"
        @card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/dinersclub.svg?238737266"
      when "Discover"
        @card_src = "https://www-mercari-jp.akamaized.net/assets/img/card/discover.svg?238737266"
      end
      @order = Order.new
    end
  end

  #注文の登録
  def create
    unless user_signed_in?
      redirect_to cart_path(@current_cart), notice: "ログインしてください"
      return
    end
    @purchaseByCard = Payjp::Charge.create(
    amount: @cart.total_price,
    customer: @card.customer_id,
    currency: 'jpy',
    card: params['payjpToken']
    )
    @order = Order.new(order_params)

    if @purchaseByCard.save && @order.save!
      OrderDetail.adjustStock_createDetail(@order, @cart.cart_details)
      NotificationMailer.send_order_confirm(@user).deliver
      # flash[:notice] = '注文が完了しました。マイページにて注文履歴の確認ができます。' #注文履歴作成予定
      flash[:notice] = '注文が完了しました。'
      redirect_to action: :confirm
    else
      flash[:alert] = "注文の登録ができませんでした"
      redirect_to action: :new
    end
  end

  def confirm
    @order = Order.order(created_at: :desc).find_by(user_id: current_user.id)
  end

  private

  def order_params
    params.permit(:user_id, :product_id, :address_id, :card_id, :quantity, :price)
  end

  def set_user
    @user = current_user
  end

  def set_cart
    @cart = current_cart
    @cart_detail = @cart.cart_details
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end

  def set_address
    @address = Address.find_by(user_id: current_user.id)
  end

  def user_signed_in
    unless user_signed_in?
      redirect_to cart_path(@cart.id), alert: "レジに進むにはログインが必要です"
    end
  end
end
