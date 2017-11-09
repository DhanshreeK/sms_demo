class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.references :course_type, foreign_key: true
      t.references :university, foreign_key: true
      t.string :no_of_seats
      t.string :fees
      t.string :status

      t.timestamps
    end
  end
end
