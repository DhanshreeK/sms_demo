class AddMciEligibilityCertificateToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :mci_eligibility_criteria_certificate_attachment, :string
  end
end
