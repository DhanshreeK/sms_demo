class AddColumnReferenceStudentToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :reference_student, :string
  end
end
