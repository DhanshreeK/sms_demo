class AddRemarkToEnquiries < ActiveRecord::Migration[5.1]
  def change
    add_column :enquiries, :remark, :string
  end
end
