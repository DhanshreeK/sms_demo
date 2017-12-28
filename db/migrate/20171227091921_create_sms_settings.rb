class CreateSmsSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :sms_settings do |t|
      t.string :send_sms
      t.string :body
      t.string :contact

      t.timestamps
    end
  end
end
