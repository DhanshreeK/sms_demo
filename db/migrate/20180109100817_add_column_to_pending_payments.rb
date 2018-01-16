class AddColumnToPendingPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :pending_payments, :fees_pending, :string
  end
end
