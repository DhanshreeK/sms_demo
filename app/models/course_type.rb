class CourseType < ApplicationRecord
	 include Activity

	belongs_to :center , optional:true
end
