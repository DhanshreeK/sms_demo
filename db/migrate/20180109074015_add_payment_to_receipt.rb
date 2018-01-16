class AddPaymentToReceipt < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :payment, :string
    add_column :receipts, :payment_date, :date
  end
end
