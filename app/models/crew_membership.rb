# == Schema Information
#
# Table name: crew_memberships
#
#  id              :integer          not null, primary key
#  tour_manager_id :integer
#  crew_member_id  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_crew_memberships_on_tour_manager_id  (tour_manager_id)
#

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
