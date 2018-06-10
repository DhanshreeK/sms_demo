class CreateSubadmins < ActiveRecord::Migration[5.1]
  def change
    create_table :subadmins do |t|
      t.string :name
      t.string :email
      t.string :subadmin_number

      t.timestamps
    end
  end
end
