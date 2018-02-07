class AddColumnsOfTotRateToReceipts < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :total_rate, :string
    add_column :receipts, :total_amt, :string
  end
end
