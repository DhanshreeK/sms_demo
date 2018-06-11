class GeneralSetting < ApplicationRecord
	include Activity
	scope :shod, ->(id) { where(id: id).take }
	has_attached_file :logo
	has_many :users
	validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png',"image/gif"]
	validates :registered_name, presence: true, format: { with: /\A[a-zA-Z.&, " "]+\z/ },
                                     length: { in: 1..100 }, on: :update
end