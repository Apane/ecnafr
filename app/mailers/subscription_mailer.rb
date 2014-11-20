class SubscriptionMailer < ActionMailer::Base
  default from: "do-not-reply@motiv8.com"
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

  def sendmyemail(email, category, quote, subscribers)
    @category = category
    @quote = quote
    @subscribers = subscribers
    @email = email

    mail to: email, subject: 'Your daily ' + @category.name.to_s  + ' quote!'
  end
end

