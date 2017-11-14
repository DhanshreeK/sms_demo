class AddColumnToCenters < ActiveRecord::Migration[5.1]
  def change
    add_column :centers, :center_status, :string
    add_column :centers, :countries, :string
  end
end
