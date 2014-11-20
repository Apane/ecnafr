class AddCategoryToQuotes < ActiveRecord::Migration
  def change
    add_reference :quotes, :category, index: true
  end
end
