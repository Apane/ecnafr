class AddNewsletterIdToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :newsletter_id, :integer
  end
end
