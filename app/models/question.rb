class Question < ApplicationRecord
	include Activity
	has_many :answers , inverse_of: :question , dependent: :destroy
	accepts_nested_attributes_for :answers  , reject_if: proc { |attributes| attributes[:answer].blank? }, allow_destroy: true
    belongs_to :student_detail , optional: true , dependent: :destroy
     
end
