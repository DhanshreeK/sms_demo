class AddFieldsToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :blood_group, :string
    add_column :students, :correspondiing_address, :string
    add_column :students, :alternate_contact, :string
  end
end
