class AddReferencesToCourseTypes < ActiveRecord::Migration[5.1]
  def change
    add_column :course_types, :center_id, :integer
  end
end
