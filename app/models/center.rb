class Center < ApplicationRecord
 #owner: ->(controller, model) { controller && controller.current_user }
 include Activity
	has_many :students, dependent: :destroy
	has_many :envelopes, dependent: :destroy
	has_many :employees, dependent: :destroy
	has_many :universities, dependent: :destroy
	has_many :course_types, dependent: :destroy
	has_many :courses, dependent: :destroy
	has_many :enquiries, dependent: :destroy
	belongs_to :sms_setting, optional:true
	belongs_to :email_setting, optional:true
	
	after_create :create_center_account

	scope :load, ->(id) { where(id: id).take }
	validates :center_name, presence: true
	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png',"image/gif"]

    validates :email, presence: true, format: \
 { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ }

 	validates :contact, :presence => true,
                        :numericality => true, format: /\d[0-9]\)*\z/,
                        :length => { :minimum => 10 }

	def self.set_center_code
	date = Date.today.strftime('%Y%m%d')
		if Student.first.nil?
			'C' + date.to_s + '1'
		else
			last_id = Student.last.id.next
			'C' + date.to_s + last_id.to_s
		end
	end
	

	private

	def create_center_account		
		user = User.create!(:email => self.email , :password => self.center_code , :password_confirmation => self.center_code , role: 'Center', center_id: self.id)
	end
end
