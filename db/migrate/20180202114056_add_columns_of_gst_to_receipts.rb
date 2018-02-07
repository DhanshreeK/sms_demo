class AddColumnsOfGstToReceipts < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :place_of_supply, :string
    add_column :receipts, :invoice_number, :string
    add_column :receipts, :gstin_no_of_customer, :string
    add_column :receipts, :description_of_services, :string
    add_column :receipts, :taxable_value, :string
    add_column :receipts, :cgst, :string
    add_column :receipts, :sgst, :string
    add_column :receipts, :igst, :string
  end
end
