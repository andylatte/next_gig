class Admin::TravelSchedulesController < AdminController
  before_action :find_tour_day, :only => [ :new, :create ]
  before_action :find_travel_schedule_items, :only => [ :new ]  
  def new
    if @tour_day.travel_schedule_items.blank?
      Rails.application.config.schedules["travel"].each do |d| 
        @tour_day.travel_schedule_items.build(:name => d)
      end
    end  
  end
  
  def create
    if @tour_day.update(travel_schedule_params)
      redirect_to admin_tour_day_path(@tour_day, :anchor => "travel_schedule")
    else
      render 'new'
    end
  end
  
  def travel_schedule_params
    params.require(:tour_day).permit( travel_schedule_items_attributes: [:name, :for_whom, :number, :origin, :destination, :start_time, :departure_datetime, :arrival_datetime, :duration, :comment])
  end
  
  def find_tour_day
    @tour_day = current_user.tour_days_managed.find(params[:tour_day_id])
  end
  def find_travel_schedule_items
    @travel_schedule_items = @tour_day.travel_schedule_items
  end
end