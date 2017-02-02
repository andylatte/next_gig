# == Schema Information
#
# Table name: tour_days
#
#  id               :integer          not null, primary key
#  date             :date
#  show_name        :string
#  km_next_day      :integer
#  comment_next_day :text
#  city             :string
#  country          :string
#  time_zone        :string
#  tour_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_tour_days_on_tour_id  (tour_id)
#

class TourDay < ApplicationRecord
  # scopes

   # associations
   belongs_to :tour
   has_one :venue, dependent: :destroy
   has_one :cargo, dependent: :destroy
   has_one :production, dependent: :destroy

   # validations
   validates :date, presence: true

   # callbacks

   # public instance methods
end
