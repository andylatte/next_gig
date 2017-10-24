class TourDaysController < ApplicationController
  layout "crew"
  def show
    @tour_day = current_user.tour_days.find(params[:id])
  end
end
