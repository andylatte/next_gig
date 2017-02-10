class ToursController < ApplicationController
  layout "crew"
  
  def index
    @tours = (current_user.tours_assigned + current_user.tours_managed).uniq
  end
  
  def show
    @tour = Tour.find(params[:id])
    @tour_days_upcoming = @tour.tour_days.upcoming
  end
end
