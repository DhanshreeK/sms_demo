class Email < ApplicationRecord
  	belongs_to :student , optional: true
  	has_many :documents
 
   	mount_uploader :attachment, AttachmentUploader
   	mount_uploader :attachment2, AttachmentUploader
end
