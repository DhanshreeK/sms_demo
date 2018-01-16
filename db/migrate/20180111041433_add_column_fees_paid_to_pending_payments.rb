class AddColumnFeesPaidToPendingPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :pending_payments, :fees_paid, :string
  end
end
