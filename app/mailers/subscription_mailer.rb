class SubscriptionMailer < ActionMailer::Base
  default from: "Motiv8 <no-reply@motiv8.io>"
  layout 'mail'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscription_mailer.quotes.subject
  #
  def notify_subscription_created(email)
    @email = email
    mail to: email, subject: 'Your subscription confirmation'
  end

  def sendmyemail(email, category, quote, subscriber)
    @category = category
    @quote = quote
    @subscriber = subscriber
    @email = email

    mail to: email, subject: 'Your daily ' + @category.name.to_s  + ' quote!'
  end
end

