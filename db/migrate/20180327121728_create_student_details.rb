class CreateStudentDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :student_details do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.text :address
    

      t.timestamps
    end
  end
end
