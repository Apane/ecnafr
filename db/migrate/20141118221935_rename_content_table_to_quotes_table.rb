class RenameContentTableToQuotesTable < ActiveRecord::Migration
  def change
    rename_table :contents, :quotes
  end
end

