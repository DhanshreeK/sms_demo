class Employee < ApplicationRecord
  include Activity
  belongs_to :center, optional:true
  belongs_to :sms_setting, optional:true
  belongs_to :email_setting, optional:true
  has_many :students, dependent: :destroy
  after_save :create_user_account
  scope :shod, ->(id) { where(id: id).take }

  validates :name, presence: true

  validates :email, presence: true, format: \
 { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ }

  validates :contact_no, :presence => true,
                        :numericality => true, format: /\d[0-9]\)*\z/,
                        :length => { :minimum => 10 }

  validates :adhar_card_no, :presence => true,
                            :numericality => true, format: /\d[0-9]\)*\z/,
                             :length => { :minimum => 12 }
  has_attached_file :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png',"image/gif"]

  


  def emp_no
    date = Date.today.strftime('%Y%m%d')
    self.employee_no = date.to_s + '1' if Employee.first.nil?
    self.employee_no = date.to_s + \
                          Employee.last.id.next.to_s unless Employee.first.nil?
  end

  private

  def create_user_account
    user = User.new do |u|
      u.email = email
      u.employee_id = id 
      u.password = employee_no
      u.role = 'Employee'
    
      u.center_id = center_id
      u.general_setting_id = if User.current
                               User.current.general_setting_id
                             else
                               1
                             end
    end
    user.save
  end
end
