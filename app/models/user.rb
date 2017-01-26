class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  
  before_create :set_admin
  
  
  def admin?
    self.is_admin?
  end
  
  private
  
  def set_admin
    self.is_admin= !(self.first_name && self.last_name)
  end
end
