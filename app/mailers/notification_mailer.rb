class NotificationMailer < ApplicationMailer
  helper :application
  def send_order_confirm(user)
    @user = user
    @cart_details = Order.find_by(user_id: current_user.id)
    @address = Address.find_by(user_id: current_user.id)
    mail(
      subject: "【BeYourCover】商品購入ありがとうございます。",
      to: @user.email #宛先
    ) do |format|
      format.text
    end
  end
end