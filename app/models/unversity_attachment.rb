class UnversityAttachment < ApplicationRecord
	 include Activity

   mount_uploader :attachment, AttachmentUploader
   belongs_to :university, optional: true
end
