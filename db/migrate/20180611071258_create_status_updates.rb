class CreateStatusUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :status_updates do |t|
      t.string :add_status
      t.string :remarks

      t.timestamps
    end
  end
end
