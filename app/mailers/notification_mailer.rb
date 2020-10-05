class NotificationMailer < ApplicationMailer
  # helper :application
  default from: 'craftclwd@gmail.com'
  def send_order_confirm(user)
    @user = user
    @order = Order.order(created_at: :desc).find_by(user_id: @user.id)
    @order_detail = OrderDetail.find_by(order_id: @order.id)
    @address = Address.find_by(user_id: @user.id)
    mail(
      subject: "【BeYourCover】商品購入ありがとうございます。",
      to: @user.email #宛先
    ) do |format|
      format.html
    end
  end
end