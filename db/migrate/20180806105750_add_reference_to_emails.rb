class AddReferenceToEmails < ActiveRecord::Migration[5.1]
  def change
    add_reference :emails, :customer_email, foreign_key: true
  end
end
