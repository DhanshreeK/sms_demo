class AddTimeToStudentDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :student_details, :stoptime, :time
  end
end
