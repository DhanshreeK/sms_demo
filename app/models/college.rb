class College < ApplicationRecord
	belongs_to :budget, optional: true

	scope :load, ->(id){where(id:id).take}

	def self.search(search)
		where("country LIKE ?" , "%#{search}")
	end

end

