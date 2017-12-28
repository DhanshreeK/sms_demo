class AddReferencesOfSmsSettingsToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :sms_setting_id, :integer
  end
end
