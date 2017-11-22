class AddReferenceCasteCategoryToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :caste_category, foreign_key: true
  end
end
