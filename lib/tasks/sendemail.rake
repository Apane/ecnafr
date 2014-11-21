namespace :send do

task :email => :environment do 
  desc "Send email"
    Category.all.each do |category|
      category.subscribers.each do |subscriber|
      quote = subscriber.choose_quote(category)
    if quote  # if quote found then send email
      SubscriptionMailer.sendmyemail(subscriber.email, category, quote.body, subscriber).deliver    
    else
      Category.all.each do |category|
        category.subscribers.each do |subscriber|
          if subscriber.subscription.present?
          SubscriptionMailer.sendmyemail(subscriber.email, category, category.quotes.order("RANDOM()").first.body, subscriber).deliver          
          end
        end
        end
      end
    end
  end  
  p 'Emails sent!'
end

end