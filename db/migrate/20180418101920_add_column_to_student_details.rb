class AddColumnToStudentDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :student_details, :time, :string
  end
end
