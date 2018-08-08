class CreateSelectedEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :selected_emails do |t|
      t.references :email, foreign_key: true
      t.references :customer_email, foreign_key: true

      t.timestamps
    end
  end
end
