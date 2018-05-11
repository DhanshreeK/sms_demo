class UserEmployee < ApplicationRecord
	 include Activity

  belongs_to :user
  belongs_to :employee
end
