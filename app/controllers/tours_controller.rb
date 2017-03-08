class ToursController < ApplicationController
  layout "crew"
  
  def index
    @active_tours = (current_user.tours_assigned.active + current_user.tours_managed.active).uniq
  end
  
  def show
    @tour = Tour.find(params[:id])
    @tour_days_upcoming = @tour.tour_days.upcoming
  end
end
