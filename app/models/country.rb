class Country < ApplicationRecord
	has_many :medical_colleges
	has_many :student_details
	has_many :student_details , through: :selected_courses , dependent: :destroy
end
