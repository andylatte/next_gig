class Admin::TourDaysController < AdminController

  before_action :find_tour, :only => [:new, :create]

  def new
    @tour_day = TourDay.new
  end

  def create
    @tour.tour_days.build(tour_day_params)
  end

  protected

  def find_tour
    @tour = Tour.find(params[:tour_id])
  end

  def tour_day_params
    params.require(:tour_day).permit(:date, :show_name, :km_next_day, :comment_next_day, :city, :country, :time_zone)
  end
end