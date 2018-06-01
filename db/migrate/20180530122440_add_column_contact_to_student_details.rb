class AddColumnContactToStudentDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :student_details, :alternate_no, :string
    add_column :student_details, :wp_no, :string
  end
end
