class CreateQuoteHistories < ActiveRecord::Migration
  def change
    create_table :quote_histories do |t|
      t.references :subscriber, index: true
      t.references :quote, index: true

      t.timestamps
    end
  end
end
