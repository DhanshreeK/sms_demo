class Answer < ApplicationRecord
	 include Activity

  belongs_to :question , inverse_of: :answers , dependent: :destroy
end
