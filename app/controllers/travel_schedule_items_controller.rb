class TravelScheduleItemsController < ApplicationController
  layout "crew"
  
  before_action :find_tour_day, :only => [:index]
    
  def index
    @travel_schedule_items = @tour_day.travel_schedule_items
  end
  
  def find_tour_day
    @tour_day = current_user.tour_days.find(params[:tour_day_id])
  end
end
