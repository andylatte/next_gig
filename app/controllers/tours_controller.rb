class ToursController < ApplicationController
  layout "crew"
  
  def index
    @tours = (current_user.tours_assigned + current_user.tours_managed).uniq
  end
end
