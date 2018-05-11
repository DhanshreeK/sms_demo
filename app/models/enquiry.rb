class Enquiry < ApplicationRecord
   include Activity


  belongs_to :center, optional:true
  belongs_to :refarence, optional:true
  belongs_to :employee, optional:true

   validates :email, presence: true, format: \
 { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ }

  validates :contact_no, :presence => true,
                        :numericality => true, format: /\d[0-9]\)*\z/,
                        :length => { :minimum => 10 }


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
