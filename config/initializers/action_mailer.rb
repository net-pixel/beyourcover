require_relative '../../lib/mail_interceptor'
ActionMailer::Base.register_interceptor(MailInterceptor)