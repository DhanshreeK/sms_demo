class AddColumnPaymentStatusToPendingPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :pending_payments, :payment_status, :boolean
  end
end
