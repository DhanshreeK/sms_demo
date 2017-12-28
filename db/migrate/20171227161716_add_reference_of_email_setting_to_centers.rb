class AddReferenceOfEmailSettingToCenters < ActiveRecord::Migration[5.1]
  def change
    add_reference :centers, :email_setting, foreign_key: true
  end
end
