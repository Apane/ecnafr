class RemoveSubscriptionIdFromSubscriptions < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :subscription_id, :integer
  end
end
