class AddColumnDiscountToPendingPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :pending_payments, :discount, :string
  end
end
