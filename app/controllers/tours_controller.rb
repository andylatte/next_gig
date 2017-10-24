class ToursController < ApplicationController
  layout "crew"
  
  def index
    @tours_active = current_user.tours_assigned.active
  end
  
  def show
    @tour = current_user.tours_assigned.find(params[:id])
    @tour_days_active = @tour.tour_days.active
  end
end
