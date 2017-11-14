class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :designation
      t.string :adhar_card_no
      t.string :contact_no
      t.string :alternate_contact_no
      t.string :email
      t.date :joining_date
      t.string :birth_place
      t.string :address
      t.string :employee_no
      t.string :status
      t.references :center, foreign_key: true
      

      t.timestamps
    end
  end
end
