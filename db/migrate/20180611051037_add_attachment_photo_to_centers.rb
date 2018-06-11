class AddAttachmentPhotoToCenters < ActiveRecord::Migration[5.1]
  def self.up
    change_table :centers do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :centers, :photo
  end
end
