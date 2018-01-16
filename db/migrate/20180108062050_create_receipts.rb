class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.string :gst_no
      t.string :date
      t.string :received_from
      t.string :amount
      t.string :towards
      t.string :payment_mode
      t.string :check_no
      t.string :check_date
      t.string :bank_name
      t.string :transaction_id
      t.references :student, foreign_key: true
      t.references :center, foreign_key: true

      t.timestamps
    end
  end
end
