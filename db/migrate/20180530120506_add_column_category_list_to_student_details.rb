class AddColumnCategoryListToStudentDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :student_details, :category_list, :string
  end
end
