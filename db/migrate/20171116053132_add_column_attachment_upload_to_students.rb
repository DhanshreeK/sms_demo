class AddColumnAttachmentUploadToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :twelth_attachment, :string
    add_column :students, :pg_attachment, :string
    add_column :students, :ug_attachment, :string
  end
end
