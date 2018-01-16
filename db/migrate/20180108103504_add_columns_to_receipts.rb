class AddColumnsToReceipts < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :pending_payment, :string
    add_column :receipts, :payment_paid, :string
  end
end
