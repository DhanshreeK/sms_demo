class College < ApplicationRecord
 include Activity
  
	belongs_to :budget, optional: true

	scope :load, ->(id){where(id:id).take}

	def self.search(search)
		where("country LIKE ?" , "%#{search}")
	end

	validates :name, presence: true
	validates :fees, presence: true

end

