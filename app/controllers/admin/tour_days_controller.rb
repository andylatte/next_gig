class Admin::TourDaysController < AdminController
  layout "print", :only => [:print]

  before_action :find_tour_day, :only => [:show, :edit, :update, :destroy, :print]
  before_action :find_tour, :only => [:show, :new, :create, :edit, :update, :destroy, :print]


  def show
  end

  def new
    @tour_day = TourDay.new
  end

  def create
    @tour_day = @tour.tour_days.build(tour_day_params)
    if @tour_day.save
      redirect_to admin_tour_path(@tour, :anchor => "tour_days")
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @tour_day.update(tour_day_params)
      redirect_to admin_tour_path(@tour, :anchor => "tour_days")
    else
      render 'edit'
    end
  end
  def destroy
    @tour_day.destroy
    redirect_to admin_tour_path(@tour, :anchor => "tour_days")
  end

  #custom methods

  def print
  end

  protected

  def find_tour
    @tour = @tour_day.nil? ? @tour = current_user.tours_managed.find(params[:tour_id]) : @tour_day.tour
  end

  def find_tour_day
    @tour_day = current_user.tour_days_managed.find(params[:id])
  end

  def tour_day_params
    params.require(:tour_day).permit(:date, :show_name, :km_next_day, :comment_next_day, :type_of_day, :city, :country, :time_zone)
  end
end
