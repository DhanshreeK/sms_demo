class CreateBulkSmsSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :bulk_sms_settings do |t|
      t.string :send_sms
      t.string :body
      t.integer :center_id

      t.timestamps
    end
  end
end
