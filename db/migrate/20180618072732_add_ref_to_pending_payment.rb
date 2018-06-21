class AddRefToPendingPayment < ActiveRecord::Migration[5.1]
  def change
    add_reference :pending_payments, :center, foreign_key: true
  end
end
