class AddReferenceToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :course_type, foreign_key: true
  end
end
