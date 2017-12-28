class AddColumnToEnvelopes < ActiveRecord::Migration[5.1]
  def change
    add_column :envelopes, :date, :date
  end
end
