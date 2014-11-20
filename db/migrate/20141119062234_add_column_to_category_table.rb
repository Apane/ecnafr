class AddColumnToCategoryTable < ActiveRecord::Migration
  def change
    add_column :categories, :subscriber_id, :integer
  end
end
