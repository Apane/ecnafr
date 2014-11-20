namespace :send do

task :email => :environment do 
  desc "Send email"
    Category.all.each do |category|
      category.subscribers.each do |subscriber|
      quote = subscriber.choose_quote(category)
    if quote  # if quote found then send email
      SubscriptionMailer.sendmyemail(subscriber.email, category, quote, category.subscribers).deliver    
    else
      Category.all.each do |category|
        category.subscribers.each do |subscriber|
          SubscriptionMailer.sendmyemail(subscriber.email, category, category.quotes.order("RANDOM()").first, category.subscribers).deliver          
          end
        end
      end
    end
  end  
  p 'Emails sent!'
end

end