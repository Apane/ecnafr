class AddColumnToSubscribers < ActiveRecord::Migration
  def change
    add_reference :subscribers, :category, index: true
  end
end
