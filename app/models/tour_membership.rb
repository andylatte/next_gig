class TourMembership < ApplicationRecord

  # scopes
  
  # associations
  belongs_to :tour
  belongs_to :crew_member, class_name: "User", foreign_key: "user_id"
  # validations
  
  # callbacks
    
  # public instance methods

end
