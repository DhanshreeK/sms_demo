class University < ApplicationRecord
	validates :university_name, presence:true
	 has_many :unversity_attachments
    accepts_nested_attributes_for :unversity_attachments
end
