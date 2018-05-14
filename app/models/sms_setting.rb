class SmsSetting < ApplicationRecord
	 include Activity

	scope :load, ->(id) { where(id: id).take }
	has_many :users
	has_many :employees
end