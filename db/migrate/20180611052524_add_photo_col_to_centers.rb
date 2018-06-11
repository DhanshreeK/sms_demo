class AddPhotoColToCenters < ActiveRecord::Migration[5.1]
  def change
    add_column :centers, :photo, :string
  end
end
