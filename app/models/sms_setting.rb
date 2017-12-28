class SmsSetting < ApplicationRecord
	scope :load, ->(id) { where(id: id).take }
	has_many :users
	has_many :employees
end