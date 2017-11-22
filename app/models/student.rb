class Student < ApplicationRecord
  belongs_to :course
  belongs_to :center
  belongs_to :university
  belongs_to :course_type
  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png',"image/gif"]
  mount_uploader :attachment, AttachmentUploader
  mount_uploader :twelth_attachment, AttachmentUploader
  mount_uploader :pg_attachment, AttachmentUploader
  mount_uploader :ug_attachment, AttachmentUploader
  mount_uploader :mci_eligibility_criteria_certificate_attachment, AttachmentUploader
   mount_uploader :admission_letter_attachment, AttachmentUploader

  def self.set_enrollment_no
    date = Date.today.strftime('%Y%m%d')
    if Student.first.nil?
      'S' + date.to_s + '1'
    else
      last_id = Student.last.id.next
      'S' + date.to_s + last_id.to_s
    end
  end

end
