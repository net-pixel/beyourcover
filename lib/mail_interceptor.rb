class MailInterceptor

  def self.delivering_email(message)
    message.bcc = "craftclwd@gmail.com"
  end

end