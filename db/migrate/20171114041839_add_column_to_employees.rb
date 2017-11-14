class AddColumnToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :employee_status, :string
  end
end
