class AddCenterToUniversities < ActiveRecord::Migration[5.1]
  def change
    add_column :universities, :center_id, :integer
  end
end
