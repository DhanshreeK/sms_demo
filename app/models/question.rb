class Question < ApplicationRecord
	has_many :answers , inverse_of: :question 
	accepts_nested_attributes_for :answers  , reject_if: proc { |attributes| attributes[:answer].blank? }, allow_destroy: true
     belongs_to :student_detail , optional: true , dependent: :destroy
     
end
