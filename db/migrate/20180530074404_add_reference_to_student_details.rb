class AddReferenceToStudentDetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :student_details, :course, foreign_key: true
  end
end
