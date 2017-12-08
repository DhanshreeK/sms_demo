class AddColToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :pin_code, :string
  end
end
