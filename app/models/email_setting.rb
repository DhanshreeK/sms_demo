class EmailSetting < ApplicationRecord
	 include Activity

  belongs_to :center, optional:true
  belongs_to :student, optional:true
  	scope :load, ->(id) { where(id: id).take }
	has_many :users
	has_many :employees
end
