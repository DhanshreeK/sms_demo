class Answer < ApplicationRecord
  belongs_to :question , inverse_of: :answers , dependent: :destroy
end
