class Envelope < ApplicationRecord
	 include Activity

  belongs_to :student
  belongs_to :center
  scope :load, ->(id) { where(id: id).take }


end
