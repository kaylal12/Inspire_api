class AddAttachmentImagePostToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :image_post
    end
  end

  def self.down
    remove_attachment :images, :image_post
  end
end
