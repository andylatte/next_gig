class VenuesController < ApplicationController
  layout "crew"
  
  before_action :find_tour_day, :only => [:show]
  
  def show
    @venue = Venue.find(params[:id])
  end
  
  def find_tour_day
    @tour_day = TourDay.find(params[:tour_day_id])
  end
end
