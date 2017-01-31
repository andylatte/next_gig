# == Schema Information
#
# Table name: tour_memberships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  tour_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tour_memberships_on_tour_id  (tour_id)
#  index_tour_memberships_on_user_id  (user_id)
#

class TourMembership < ApplicationRecord

  # scopes
  
  # associations
  belongs_to :tour
  belongs_to :crew_member, class_name: "User", foreign_key: "user_id"
  # validations
  
  # callbacks
    
  # public instance methods

end
