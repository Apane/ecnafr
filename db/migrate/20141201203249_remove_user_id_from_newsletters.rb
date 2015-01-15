class RemoveUserIdFromNewsletters < ActiveRecord::Migration
  def change
    remove_column :newsletters, :user_id, :integer
  end
end
