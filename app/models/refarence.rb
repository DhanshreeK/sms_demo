class Refarence < ApplicationRecord
	 include Activity

		validates :name, presence: true
end
