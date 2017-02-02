# == Schema Information
#
# Table name: venues
#
#  id          :integer          not null, primary key
#  tour_day_id :integer
#  venue_name  :string
#  address     :string
#  zip_code    :string
#  city        :string
#  country     :string
#  url         :string
#  event_type  :string
#  slot        :string
#  sales       :string
#  capacity    :string
#  comment     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_venues_on_tour_day_id  (tour_day_id)
#

class Venue < ApplicationRecord
  # scopes

   # associations
   belongs_to :tour_day

   # validations
   validates :venue_name, presence: true

   # callbacks

   # public instance methods
end
