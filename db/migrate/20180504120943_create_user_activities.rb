class CreateUserActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :user_activities do |t|
      t.string :modelname
      t.integer :model_id
      t.string :action
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
