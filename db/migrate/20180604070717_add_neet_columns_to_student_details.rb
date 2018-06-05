class AddNeetColumnsToStudentDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :student_details, :neet, :string
    add_reference :student_details, :college, foreign_key: true
    add_reference :student_details, :budget, foreign_key: true
  end
end
