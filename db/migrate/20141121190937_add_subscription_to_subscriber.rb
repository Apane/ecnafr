class AddSubscriptionToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :subscription, :boolean
  end
end
