class CreateCenters < ActiveRecord::Migration[5.1]
  def change
    create_table :centers do |t|
      t.string :center_name
      t.string :address
      t.string :city
      t.string :state
      t.string :pan_card_no
      t.string :contact
      t.string :alternate_contact
      t.date :center_starting_date
      t.string :contact_person_name
      t.string :residential_address
      t.string :center_code
      t.string :country
      t.string :status

      t.timestamps
    end
  end
end
