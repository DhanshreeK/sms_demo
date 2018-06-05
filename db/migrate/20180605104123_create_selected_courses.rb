class CreateSelectedCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :selected_courses do |t|
      t.references :student_detail, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
