class Budget < ApplicationRecord
	 include Activity

	has_many :colleges

	def budget_range
        [budget_from, budget_to].join('-')
    end

end
