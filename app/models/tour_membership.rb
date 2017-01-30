class TourMembership < ApplicationRecord

  # scopes
  
  # associations
  belongs_to :tour
  belongs_to :crew_member, class_name: "User", foreign_key: "user_id"
  # validations
  
  
  # attr_accessible
  
  # callbacks
    
  # public instance methods

end
