class AddAttachmentLogoToGeneralSettings < ActiveRecord::Migration[5.1]
  def self.up
    change_table :general_settings do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :general_settings, :logo
  end
end
