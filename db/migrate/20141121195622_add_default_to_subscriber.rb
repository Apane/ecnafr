class AddDefaultToSubscriber < ActiveRecord::Migration
  def change
    change_column :subscribers, :subscription, :boolean, default: true
  end
end
