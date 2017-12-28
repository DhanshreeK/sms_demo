class AddReferenceToCenters < ActiveRecord::Migration[5.1]
  def change
    add_column :centers, :sms_setting_id, :integer
  end
end
