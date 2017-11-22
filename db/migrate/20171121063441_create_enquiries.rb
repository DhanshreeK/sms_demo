class CreateEnquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :enquiries do |t|
      t.string :full_name
      t.string :email
      t.string :contact_no
      t.string :alternate_contact_no
      t.references :center, foreign_key: true

      t.timestamps
    end
  end
end
