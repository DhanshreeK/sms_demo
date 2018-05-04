class AddRefToCollege < ActiveRecord::Migration[5.1]
  def change
    add_reference :colleges, :budget, foreign_key: true
  end
end
