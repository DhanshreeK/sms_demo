class AddReferenceToEnquiries < ActiveRecord::Migration[5.1]
  def change
    add_reference :enquiries, :refarence, foreign_key: true
  end
end
