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
   
   has_one :venue,           dependent: :destroy
   has_one :cargo,           dependent: :destroy
   has_one :production,      dependent: :destroy
   
   has_one :primary_hotel,   dependent: :destroy
   has_one :secondary_hotel, dependent: :destroy
   has_one :driver_hotel,    dependent: :destroy
   
   has_many :travel_schedule_items, dependent: :destroy
   accepts_nested_attributes_for :travel_schedule_items
   
   has_many :show_schedule_items,   dependent: :destroy
   has_many :promo_schedule_items,  dependent: :destroy
   
   # validations
   validates :date, presence: true

   # callbacks

   # public instance methods
end
