class HotelsController < ApplicationController
  layout "crew"
  before_action :find_tour_day, :only => [:index]
  
  def index
    @primary_hotel = @tour_day.primary_hotel
    @secondary_hotel = @tour_day.secondary_hotel
    @driver_hotel = @tour_day.driver_hotel
  end
  
  
  def find_tour_day
    @tour_day = TourDay.find(params[:tour_day_id])
  end
end
