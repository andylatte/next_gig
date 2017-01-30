class User < ApplicationRecord
  
  # scopes
  
  # associations
  
  # Memberships & Crew
  has_many :tour_management_memberships, class_name: "CrewMembership", foreign_key: "tour_manager_id"
  has_many :crew_members_available, through: :tour_management_memberships, source: "crew_member"

  has_many :crew_memberships, foreign_key: "crew_member_id", dependent: :destroy

  # Tours & Tour Memberships
  has_many :tour_memberships
  
  has_many :tours_managed, class_name: "Tour", foreign_key: "user_id"
  has_many :tours_assigned, class_name: "Tour", foreign_key: "user_id", through: :tour_memberships
  
  # plugins/config
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  
  # validations
  validates :first_name, :last_name, presence: true
  
  # attr_accessible
  
  # callbacks
    
  # public instance methods
  
  def admin?
    self.is_admin?
  end
  
  private

end
