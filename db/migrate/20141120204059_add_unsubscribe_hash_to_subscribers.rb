class AddUnsubscribeHashToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :unsubscribe_hash, :string
  end
end
