class TourDaysController < ApplicationController
  layout "crew"
  def show
    @tour_day = TourDay.find(params[:id])
  end
end
