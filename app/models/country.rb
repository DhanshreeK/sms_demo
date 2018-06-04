class Country < ApplicationRecord
	has_many :medical_colleges
	has_many :student_details
end
