class ToursController < ApplicationController
  layout "crew"
  
  def index
    @tours_active = (current_user.tours_assigned.active + current_user.tours_managed.active).uniq
  end
  
  def show
    @tour = Tour.find(params[:id])
    @tour_days_active = @tour.tour_days.active
  end
end
