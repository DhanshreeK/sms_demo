class AddReferencesToStudentDetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :student_details, :status_update, foreign_key: true
  end
end
