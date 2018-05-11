class UserActivity < ApplicationRecord
   include Activity

  belongs_to :user
  scope :shod, ->(id) { where(id: id).take }

  # method used for track activity and create user activity
  def self.activity(name, id, action)
  
    UserActivity.create(user_id: 1 , modelname: name , model_id: id , action: action)
  end

  # get all attributed of selected modelname
  def activity_model

  (Object.const_get modelname).find(model_id).attributes
  #ApplicationRecord.send(:subclasses).map(&:name)

  end

end

