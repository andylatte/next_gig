class Admin::TourDaysController < AdminController

  before_action :find_tour, :only => [:show, :new, :create, :edit, :destroy]
  before_action :find_tour_day, :only => [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @tour_day = TourDay.new
  end

  def create
    @tour_day = @tour.tour_days.build(tour_day_params)
    if @tour_day.save
      redirect_to admin_tour_path(@tour)
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @tour_day.update(tour_day_params)
      redirect_to admin_tour_tour_day_path(@tour_day)
    else
      render 'edit'
    end
  end
  def destroy
    @tour_day.destroy
    redirect_to admin_tour_path(@tour)
  end
  
  protected

  def find_tour
    @tour = Tour.find(params[:tour_id])
  end
  
  def find_tour_day
    @tour_day = TourDay.find(params[:id])
  end

  def tour_day_params
    params.require(:tour_day).permit(:date, :show_name, :km_next_day, :comment_next_day, :city, :country, :time_zone)
  end
end