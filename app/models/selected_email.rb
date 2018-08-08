class SelectedEmail < ApplicationRecord
  belongs_to :email
  belongs_to :customer_email
end
