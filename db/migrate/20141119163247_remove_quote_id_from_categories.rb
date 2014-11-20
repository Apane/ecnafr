class RemoveQuoteIdFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :quote_id
    remove_column :categories, :subscriber_id
  end
end
