class MedicalCollege < ApplicationRecord
  belongs_to :country , optional: :true
  has_many :student_details
  has_many :student_details , through: :selected_courses , dependent: :destroy
end
