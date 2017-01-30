class Tour < ApplicationRecord

  # scopes
  
  # associations
  belongs_to :manager, class_name: "User", foreign_key: "user_id"

  # validations
  validates :tour_name, :band_name, presence: true
  
  # attr_accessible
  
  # callbacks
    
  # public instance methods

end
