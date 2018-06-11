class StudentDetail < ApplicationRecord
	include Activity
	belongs_to :status_update, optional:true
	has_many :questions , dependent: :destroy
	has_many :student_answers , dependent: :destroy
	has_many :comments, dependent: :destroy
	# belongs_to :country, optional:true
	# belongs_to :medical_college, optional:true
	has_many :selected_courses, dependent: :destroy
	belongs_to :budget, optional:true
	has_many :courses, through: :selected_courses , dependent: :destroy
	has_many :medical_colleges , through: :selected_courses , dependent: :destroy
	has_many :countries , through: :selected_courses , dependent: :destroy


	validates :first_name, presence: :true
	validates :email, presence: true, format: \
  { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ }
  #   validates :contact_no, numericality: { only_integer: true }, length: \
  # { minimum: 6, maximum: 11 }, allow_blank: true
    validates :ssc_marks, presence: :true
    # validates :hsc_marks, presence: :true
    validates :birthdate, presence: :true

	def self.search(search)
		where("contact_no LIKE ?" , "%#{search}%")
	end
end
