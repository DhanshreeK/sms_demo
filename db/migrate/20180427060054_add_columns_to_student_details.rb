class AddColumnsToStudentDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :student_details, :course_applied_for, :string
    add_column :student_details, :age, :string
    add_column :student_details, :birthdate, :date
    add_column :student_details, :father_name, :string
    add_column :student_details, :mother_name, :string
    add_column :student_details, :father_education, :string
    add_column :student_details, :father_occupation, :string
    add_column :student_details, :mother_education, :string
    add_column :student_details, :ssc_marks, :string
    add_column :student_details, :hsc_marks, :string
    add_column :student_details, :pcb, :string
    add_column :student_details, :pcm, :string
    add_column :student_details, :signature, :text
  end
end
