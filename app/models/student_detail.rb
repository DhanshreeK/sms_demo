class StudentDetail < ApplicationRecord
	has_many :questions , dependent: :destroy
	has_many :student_answers , dependent: :destroy

	def self.search(search)
		where("contact_no LIKE ?" , "%#{search}%")
	end
end
