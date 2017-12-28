class Student < ApplicationRecord
  belongs_to :course
  belongs_to :center
  belongs_to :university
  belongs_to :employee
  belongs_to :refarence
  belongs_to :course_type
  has_attached_file :photo
  has_many :envelopes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png',"image/gif"]
  mount_uploader :attachment, AttachmentUploader
  mount_uploader :twelth_attachment, AttachmentUploader
  mount_uploader :pg_attachment, AttachmentUploader
  mount_uploader :ug_attachment, AttachmentUploader
  mount_uploader :mci_eligibility_criteria_certificate_attachment, AttachmentUploader
  mount_uploader :admission_letter_attachment, AttachmentUploader
  validates :twelth_attachment, presence:true
  validates :attachment, presence:true
  after_save :send_bulk_message

  def self.set_enrollment_no
    date = Date.today.strftime('%Y%m%d')
    if Student.first.nil?
      'S' + date.to_s + '1'
    else
      last_id = Student.last.id.next
      'S' + date.to_s + last_id.to_s
    end
  end

  def send_bulk_message
    if SmsSetting.first.send_sms == "Yes"
    require "rubygems"
    require "net/https"
    require "uri"
    require "json"
    uname = "pawarakash235@gmail.com"
    hash = "4a9bfc715e5a833379d6c647fec325808c3a1d218cacb91f9c4fa5339e597043"
    message = SmsSetting.first.body
    numbers = self.contact_no
    sender = "TXTLCL" 
    requested_url = 'http://api.textlocal.in/send/?' + "username=" + uname + "&hash=" + hash + "&numbers=" + numbers + "&message=" + message + "&sender=" + sender
    uri = URI.parse(requested_url)
    http = Net::HTTP.start(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    res = http.request(request)
    response = JSON.parse(res.body)
    puts (response)
  end
end

end
