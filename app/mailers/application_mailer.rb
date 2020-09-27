class ApplicationMailer < ActionMailer::Base
  default from: 'craftclwd@gmail.com'
  layout 'mailer'

  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  rescue StandardError => e
    # ↓が実行されると思っていたが実行されなかった、何故？？？
    Rails.logger.error("failed send mail. #{e.message}")
  end
end
