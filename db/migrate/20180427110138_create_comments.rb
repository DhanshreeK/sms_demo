class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :student_detail, foreign_key: true
      t.datetime :stoptime

      t.timestamps
    end
  end
end
