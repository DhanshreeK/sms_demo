class AddColumnToStudentDetail < ActiveRecord::Migration[5.1]
  def change
    add_column :student_details, :contact_no, :string
  end
end
