class PendingPayment < ApplicationRecord
	include Activity
	belongs_to :student
	belongs_to :receipt
	belongs_to :center , optional: :true
	scope :load, ->(id) { where(id: id).take }
	 def self.to_csv(options = {})
	    CSV.generate(options) do |csv|
	      csv << column_names
	      all.each do |report|
	        csv << report.attributes.values_at(*column_names)
	      end
	    end
  end
  
end
