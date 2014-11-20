# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "#{path}/log/cron_log.log"

every 1.days, at: "7:00 am", do
    runner "Category.all.each do |category|
              category.subscribers.each do |subscriber|
                SubscriptionMailer.sendmyemail(subscriber.email, category, subscriber.choose_quote(category), category.subscribers).deliver          
              end
            end"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
