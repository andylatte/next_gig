# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  is_admin               :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  remember_created_at    :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  
  # scopes
  
  # associations
  # Memberships & Crew
  has_many :tour_management_memberships, class_name: "CrewMembership", foreign_key: "tour_manager_id"
  has_many :crew_members_available, through: :tour_management_memberships, source: "crew_member"

  has_many :crew_memberships, foreign_key: "crew_member_id", dependent: :destroy

  # Tours & Tour Memberships
  has_many :tour_memberships, dependent: :destroy
  
  has_many :tours_managed, -> { order 'created_at asc' }, class_name: "Tour", foreign_key: "user_id"
  has_many :tours_assigned, -> { order 'created_at asc' }, through: :tour_memberships, class_name: "Tour", foreign_key: "tour_id", source: :tour
  
  # plugins/config
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable,
         :recoverable, :trackable, :validatable
  
  # validations
  validates :first_name, :last_name, presence: true
  
  
  # callbacks
    
  # public instance methods
  
  def admin?
    self.is_admin?
  end
  
  def name
    self.first_name + " " + self.last_name
  end
  
  private

end
