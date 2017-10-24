# == Schema Information
#
# Table name: tours
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  tour_name       :string
#  band_name       :string
#  tour_days_count :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  start_date      :date             not null
#
# Indexes
#
#  index_tours_on_user_id  (user_id)
#

class Tour < ApplicationRecord

  # scopes
  scope :active, -> { joins(:tour_days).merge(TourDay.active).uniq }
  
  # associations
  belongs_to :manager, class_name: "User", foreign_key: "user_id"
  
  has_many :tour_memberships, dependent: :destroy
  accepts_nested_attributes_for :tour_memberships
  
  has_many :crew_members, -> { order 'first_name asc' }, through: :tour_memberships, class_name: "User", foreign_key: "user_id"
  
  has_many :tour_days, -> { order 'date asc' }, dependent: :destroy
  
  # validations
  validates :tour_name, :band_name, presence: true
  validates_date :start_date 

  # callbacks
  before_validation do
    self.start_date = Date.today unless self.start_date
  end
  
  after_create do
    self.crew_members << self.manager
  end
    
  # public instance methods
  def from_to
    if tour_days.blank?
      "--"
    else
      tour_days.first.date.to_s(:le) + " - " + tour_days.last.date.to_s(:le)
    end
  end
  
  def update_start_date
    self.update(start_date: self.tour_days.first.date) unless self.tour_days.blank?
  end
end
