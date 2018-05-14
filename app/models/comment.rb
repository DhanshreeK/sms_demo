class Comment < ApplicationRecord
	 include Activity

  belongs_to :student_detail
end
