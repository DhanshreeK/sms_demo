class Course < ApplicationRecord
  include Activity
  validates :course_name, presence: true
  belongs_to :course_type
  belongs_to :university
  belongs_to :center, optional:true
  has_many :students, dependent: :destroy
  has_many :selected_courses
  has_many :student_details , through: :selected_courses , dependent: :destroy


  scope :load, ->(id) { where(id: id).take }
end
