class AddColumnDiscountToReceipts < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :discount, :string
  end
end
