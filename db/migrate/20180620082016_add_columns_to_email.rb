class AddColumnsToEmail < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :cc, :string
    add_column :emails, :bcc, :string
    add_column :emails, :attachment2, :string
  end
end
