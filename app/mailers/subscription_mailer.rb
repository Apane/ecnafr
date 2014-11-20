class SubscriptionMailer < ActionMailer::Base
  default from: "Motiv8 <no-reply@motiv8.com>"
  layout 'mail'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscription_mailer.quotes.subject
  #
  def quotes(email, quote)
    @quote = quote
    mail to: email, subject: "test"
  end

  def sendmyemail(email, category, quote, subscriber)
    @category = category
    @quote = quote
    @subscriber = subscriber
    @email = email

    mail to: email, subject: 'Your daily ' + @category.name.to_s  + ' quote!'
  end
end

