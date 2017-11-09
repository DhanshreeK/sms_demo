class CreateUniversities < ActiveRecord::Migration[5.1]
  def change
    create_table :universities do |t|
      t.string :university_name
      t.string :description
      t.string :country
      t.string :status

      t.timestamps
    end
  end
end
