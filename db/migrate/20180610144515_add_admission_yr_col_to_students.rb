class AddAdmissionYrColToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :admission_year, :date
  end
end
