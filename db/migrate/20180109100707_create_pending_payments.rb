class CreatePendingPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :pending_payments do |t|
      t.references :student, foreign_key: true
      t.references :receipt, foreign_key: true

      t.timestamps
    end
  end
end
