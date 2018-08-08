class Email < ApplicationRecord
  	belongs_to :student , optional: true
  	has_many :documents
  	has_many :selected_emails 
    has_many :customer_emails, through: :selected_emails , dependent: :destroy
   	mount_uploader :attachment, AttachmentUploader
   	mount_uploader :attachment2, AttachmentUploader
end