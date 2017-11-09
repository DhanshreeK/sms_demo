class CreateUnversityAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :unversity_attachments do |t|
      t.references :university, index: true
      t.string :attachment
      t.string :attachment_name

      t.timestamps
    end
  end
end
