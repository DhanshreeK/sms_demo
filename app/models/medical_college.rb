class MedicalCollege < ApplicationRecord
  belongs_to :country , optional: :true
  has_many :student_details
end
