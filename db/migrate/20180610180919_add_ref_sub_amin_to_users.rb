class AddRefSubAminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :subadmin, foreign_key: true
  end
end
