class Receipt < ApplicationRecord
  include Activity
  belongs_to :student, optional:true
  belongs_to :center, optional:true
  validates_presence_of :payment, message: 'You must add the amount to pay'

  def self.set_invoice_no
    date = Date.today.strftime('%d')
    if Receipt.first.nil?
      'IN' + date.to_s + '1'
    else
      last_id = Receipt.last.id.next
      'IN' + date.to_s + last_id.to_s
    end
  end
end
