class User < ApplicationRecord
  
  # scopes
  
  # associations
  has_many :crew_memberships, class_name: "CrewMembership", foreign_key: "tour_manager_id"
  has_many :crew_members, class_name: "User", through: :crew_memberships
  
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
