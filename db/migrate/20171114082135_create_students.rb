class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :contact_no
      t.string :alternate_contact_no
      t.string :gender
      t.date :date_of_birth
      t.string :father_name
      t.string :mother_name
      t.string :father_contact_no
      t.string :mother_contact_no
      t.string :permanent_address
      t.string :state
      t.string :country
      t.string :tenth
      t.string :twelth
      t.string :pcm
      t.string :pcmb
      t.string :graduation
      t.string :post_graduation
      t.string :passport_available
      t.string :passport_applied
      t.string :passport_not_applied
      t.references :course, foreign_key: true
      t.references :center, foreign_key: true
      t.references :university, foreign_key: true

      t.timestamps
    end
  end
end
