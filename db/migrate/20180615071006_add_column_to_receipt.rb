class AddColumnToReceipt < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :current_payment, :string
  end
end
