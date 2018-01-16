class PendingPayment < ApplicationRecord
  belongs_to :student
  belongs_to :receipt
  scope :load, ->(id) { where(id: id).take }
end
