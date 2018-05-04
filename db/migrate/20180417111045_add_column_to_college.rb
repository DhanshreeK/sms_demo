class AddColumnToCollege < ActiveRecord::Migration[5.1]
  def change
    add_column :colleges, :country, :string
  end
end
