class RenameColumnOnCategoriesTable < ActiveRecord::Migration
  def change
    rename_column :categories, :content_id, :quote_id
  end
end
