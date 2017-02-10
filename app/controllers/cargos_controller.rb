class CargosController < ApplicationController

  layout "crew"
  
  before_action :find_tour_day, :only => [:show]
  
  def show
    @cargo = Cargo.find(params[:id])
  end
  
  def find_tour_day
    @tour_day = TourDay.find(params[:tour_day_id])
  end
end
