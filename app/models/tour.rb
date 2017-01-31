class Tour < ApplicationRecord

  # scopes
  
  # associations
  belongs_to :manager, class_name: "User", foreign_key: "user_id"
  
  has_many :tour_memberships
  accepts_nested_attributes_for :tour_memberships
  
  has_many :crew_members, through: :tour_memberships, class_name: "User", foreign_key: "user_id"
  
  has_many :tour_days
  
  # validations
  validates :tour_name, :band_name, presence: true
  
  # callbacks
    
  # public instance methods

end
