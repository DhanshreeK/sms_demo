class SelectedCourse < ApplicationRecord
  belongs_to :student_detail
  belongs_to :course
end
