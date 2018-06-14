class SelectedCourse < ApplicationRecord
  belongs_to :student_detail, optional:true
  belongs_to :course, optional:true
  belongs_to :medical_college, optional:true
  belongs_to :country, optional:true
end
