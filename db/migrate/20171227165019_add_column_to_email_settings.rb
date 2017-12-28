class AddColumnToEmailSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :email_settings, :send_email, :boolean
  end
end
