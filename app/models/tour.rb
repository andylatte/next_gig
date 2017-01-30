class Tour < ApplicationRecord

  # scopes
  
  # associations
  belongs_to :manager, class_name: "User", foreign_key: "user_id"
  
  has_many :tour_memberships
  has_many :crew_members, through: :tour_memberships, class_name: "User", foreign_key: "user_id"
  
  # validations
  validates :tour_name, :band_name, presence: true
  
  # attr_accessible
  
  # callbacks
    
  # public instance methods

end
