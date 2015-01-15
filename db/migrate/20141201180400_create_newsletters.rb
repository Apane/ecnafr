class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
