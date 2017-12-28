class AddSmsSettingReferencesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :sms_setting_id, :integer
  end
end
