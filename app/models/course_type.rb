class CourseType < ApplicationRecord
	belongs_to :center , optional:true
end
