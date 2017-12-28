class Employee < ApplicationRecord
  belongs_to :center, optional:true
  belongs_to :sms_setting, optional:true
  belongs_to :email_setting, optional:true
  after_save :create_user_account
  scope :shod, ->(id) { where(id: id).take }


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
      u.general_setting_id = if User.current
                               User.current.general_setting_id
                             else
                               1
                             end
    end
    user.save
  end
end
