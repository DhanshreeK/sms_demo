class Course < ApplicationRecord
	 include Activity
  
	validates :course_name, presence: true
  belongs_to :course_type
  belongs_to :university
  belongs_to :center, optional:true
  has_many :students
  scope :load, ->(id) { where(id: id).take }
end
