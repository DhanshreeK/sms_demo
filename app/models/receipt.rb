class Receipt < ApplicationRecord
  belongs_to :student, optional:true
  belongs_to :center, optional:true
end
