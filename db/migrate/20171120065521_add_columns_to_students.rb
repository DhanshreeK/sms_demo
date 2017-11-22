class AddColumnsToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :fees_paid, :string
    add_column :students, :original_document_submission, :string
    add_column :students, :processing_fees_paid, :string
    add_column :students, :all_document_sent_to_ho, :string
    add_column :students, :sent_for_visa, :string
    add_column :students, :sent_for_mci, :string
    add_column :students, :visa_appointment, :string
    add_column :students, :mci_acknowledgement, :string
    add_column :students, :visa_stamping, :string
    add_column :students, :mci_eligibility_certificate, :string
    add_column :students, :airticket, :string
    add_column :students, :fly, :string
  end
end
