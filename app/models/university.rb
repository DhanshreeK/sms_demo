class University < ApplicationRecord
	include Activity
	validates :university_name, presence:true
	has_many :unversity_attachments, dependent: :destroy
    accepts_nested_attributes_for :unversity_attachments
    belongs_to :center, optional:true
    scope :load, ->(id) { where(id: id).take }
    has_many :students, dependent: :destroy
end
