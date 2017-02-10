class ProductionsController < ApplicationController

  layout "crew"
  
  before_action :find_tour_day, :only => [:show]
  
  def show
    @production = Production.find(params[:id])
  end
  
  def find_tour_day
    @tour_day = TourDay.find(params[:tour_day_id])
  end
end
