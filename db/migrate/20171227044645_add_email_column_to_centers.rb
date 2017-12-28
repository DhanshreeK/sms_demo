class AddEmailColumnToCenters < ActiveRecord::Migration[5.1]
  def change
    add_column :centers, :email, :string
  end
end
