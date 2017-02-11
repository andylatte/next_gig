# == Schema Information
#
# Table name: tour_days
#
#  id               :integer          not null, primary key
#  date             :date
#  show_name        :string
#  km_next_day      :string
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
  scope :upcoming, -> { where("date >= ?", Date.today) }

  # associations
  belongs_to :tour, counter_cache: true
  
  has_one :venue,           dependent: :destroy
  has_one :cargo,           dependent: :destroy
  has_one :production,      dependent: :destroy
   
  has_one :primary_hotel,   dependent: :destroy
  has_one :secondary_hotel, dependent: :destroy
  has_one :driver_hotel,    dependent: :destroy
  
  has_many :hotels
  
  has_many :travel_schedule_items, -> { order 'start_time asc' }, dependent: :destroy   
  has_many :show_schedule_items, -> { order 'start_time asc' }, dependent: :destroy
  has_many :promo_schedule_items, -> { order 'start_time asc' }, dependent: :destroy
   
  accepts_nested_attributes_for :travel_schedule_items, reject_if: proc { |attributes| attributes['departure_datetime'].blank? }
  accepts_nested_attributes_for :show_schedule_items, reject_if: proc { |attributes| attributes['start_time'].blank? }
   
  # validations
  validates_date :date 
  # callbacks

  # public instance methods
  
  def next_tour_day
    TourDay.where('date > ? ', date).order(date: :asc).first 
  end
  
end
