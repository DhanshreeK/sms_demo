class AddReferenceOfEmailSettingToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :email_setting, foreign_key: true
  end
end
