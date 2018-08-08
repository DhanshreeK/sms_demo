class RemoveReferenceFromEmails < ActiveRecord::Migration[5.1]
  def change
  	remove_column :emails, :customer_email_id
  end
end
