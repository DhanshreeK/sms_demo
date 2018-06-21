class AddColumnToEmail < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :attachment, :string
  end
end
