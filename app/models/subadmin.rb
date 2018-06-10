class Subadmin < ApplicationRecord
	after_save :create_user_account

  def subadmin_no
    date = Date.today.strftime('%Y%m%d')
    self.subadmin_number = date.to_s + '1' if Subadmin.first.nil?
    self.subadmin_number = date.to_s + \
                          Subadmin.last.id.next.to_s unless Subadmin.first.nil?
  end

  def create_user_account
  	User.create(email: self.email, password: self.subadmin_number, role: 'SubAdmin')
  end

end
