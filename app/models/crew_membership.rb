class CrewMembership < ApplicationRecord
  belongs_to :crew_member, class_name: "User"
  belongs_to :admin, class_name: "User", foreign_key: "tour_manager_id"
end