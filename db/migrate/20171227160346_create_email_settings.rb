class CreateEmailSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :email_settings do |t|
      t.string :body
      t.references :center, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
