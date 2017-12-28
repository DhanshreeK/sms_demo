class CreateEnvelopes < ActiveRecord::Migration[5.1]
  def change
    create_table :envelopes do |t|
      t.references :student, foreign_key: true
      t.references :center, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
