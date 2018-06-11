class AddRefToSelectedCourses < ActiveRecord::Migration[5.1]
  def change
    add_reference :selected_courses, :medical_college, foreign_key: true
    add_reference :selected_courses, :country, foreign_key: true
  end
end
