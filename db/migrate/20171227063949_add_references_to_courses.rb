class AddReferencesToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :center_id, :integer
  end
end
