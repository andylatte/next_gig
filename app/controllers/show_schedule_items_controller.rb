class ShowScheduleItemsController < ApplicationController

  layout "crew"
  
  before_action :find_tour_day, :only => [:index]
    
  def index
    @sorted_show_schedule_items = @tour_day.sorted_show_schedule_items
  end
  
  def find_tour_day
    @tour_day = TourDay.find(params[:tour_day_id])
  end
end