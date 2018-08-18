class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :general_setting, optional:true
  belongs_to :subadmin, optional:true
  scope :shod, ->(id) { where(id: id).take }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_attached_file :photo,
  :url => "/assets/students/:basename.:extension",
  :path => ":rails_root/public/assets/students/:basename.:extension"
  scope :role_wise_users, ->(role) { where(role: role) }
  
  validates_attachment_content_type :photo, content_type: \
  ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']

  belongs_to :student, optional:true
  belongs_to :center, optional:true
  belongs_to :sms_setting, optional:true
  belongs_to :employee, optional:true
  belongs_to :sms_setting, optional:true
  belongs_to :email_setting, optional:true


  def create_general_setting
    role = 'Student'
    role = 'SuperAdmin' if id == 1
    gs = GeneralSetting.create(registered_name: 'Vishwa Vidya consultancy Pvt. Ltd.')
    update(general_setting_id: gs.id, role: role)
  end

  def employee
    return unless role == 'Employee'
    Employee.shod(employee_id)
  end
  
  def create_user_employee(employee_number, email)
    employee_number.each do |emp_no|
      UserEmployees.create(email: email, employee_number: emp_no)
    end
  end

   # getter for current user
  def self.current
    Thread.current[:user]
  end

  # setter for current user
  def self.current=(user)
    Thread.current[:user] = user
  end
  
end