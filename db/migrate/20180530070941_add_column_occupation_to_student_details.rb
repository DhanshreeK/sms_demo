class AddColumnOccupationToStudentDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :student_details, :mother_occupation, :string
  end
end
