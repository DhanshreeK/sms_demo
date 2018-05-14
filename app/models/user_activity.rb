class UserActivity < ApplicationRecord
   

  belongs_to :user
  scope :shod, ->(id) { where(id: id).take }

  # method used for track activity and create user activity
  def self.activity(name, id, action)
    if User.current.present?
    UserActivity.create(user_id: User.current.id , modelname: name , model_id: id , action: action)
    end
  end

  # get all attributed of selected modelname
  def activity_model
  (Object.const_get modelname).find(model_id).attributes
  #ApplicationRecord.send(:subclasses).map(&:name)

  end

end

