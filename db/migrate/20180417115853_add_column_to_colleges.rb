class AddColumnToColleges < ActiveRecord::Migration[5.1]
  def change
    add_column :colleges, :fees, :string
  end
end
