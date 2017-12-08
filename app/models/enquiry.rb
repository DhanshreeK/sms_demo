class Enquiry < ApplicationRecord
  belongs_to :center
  belongs_to :refarence
  belongs_to :employee

  def self.to_csv(fields = column_names, options = {})
   CSV.generate(options) do |csv|
    csv << column_names
    all.each do |customer_detail|
      # if customer_detail.status == 'Work-Done' 
        csv << customer_detail.attributes.values_at(*column_names)
#         elsif customer_detail.status == 'Pending' 
#           csv << customer_detail.attributes.values_at(*column_names)
#           elsif customer_detail.status == 'Good Delivered'
#              csv << customer_detail.attributes.values_at(*column_names)
#   end
    end
    end
    end

end
