class StudentAnswer < ApplicationRecord
  belongs_to :student_detail , dependent: :destroy
  belongs_to :question , dependent: :destroy
  belongs_to :answer, dependent: :destroy
end
