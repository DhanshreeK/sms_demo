class AddAdmissionLetterAttachmentToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :admission_letter_attachment, :string
  end
end
