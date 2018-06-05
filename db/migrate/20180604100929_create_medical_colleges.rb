class CreateMedicalColleges < ActiveRecord::Migration[5.1]
  def change
    create_table :medical_colleges do |t|
      t.string :college_name
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
