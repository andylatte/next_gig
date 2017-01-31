class CrewMembership < ApplicationRecord
  # scopes
  
  # associations
  belongs_to :crew_member, class_name: "User"
  belongs_to :admin, class_name: "User", foreign_key: "tour_manager_id"
  
  # validations
  
  # plugins/config
  
  # callbacks
    
  # public instance methods
  
end