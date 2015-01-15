class AddAttachmentToNewsletters < ActiveRecord::Migration
  def change
    add_attachment :newsletters, :image
  end
end