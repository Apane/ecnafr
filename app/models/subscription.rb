class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :newsletter
  belongs_to :subscribed, class_name: 'User', foreign_key: 'subscription_id'
end
