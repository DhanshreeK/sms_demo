class AddColumnPermanentPinToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :permanent_pin, :string
  end
end
