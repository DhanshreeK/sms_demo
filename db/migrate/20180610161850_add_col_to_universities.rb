class AddColToUniversities < ActiveRecord::Migration[5.1]
  def change
    add_column :universities, :fees, :string
    add_column :universities, :no_of_seats, :string
  end
end
