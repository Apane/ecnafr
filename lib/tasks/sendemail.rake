namespace :send do

task :email => :environment do 
  desc "Send email"
    Category.all.each do |category|
      category.subscribers.each do |subscriber|
     # quote = subscriber.choose_quote(category)
          if subscriber.subscription.present?
          SubscriptionMailer.sendmyemail(subscriber.email, category, category.quotes.order("RANDOM()").first.body, subscriber).deliver          
      end
    end
  end  
  p 'Emails sent!'
end

end