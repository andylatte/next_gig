class Admin::ShowSchedulesController < AdminController
  before_action :find_tour_day, :only => [ :new, :create ]
  before_action :find_show_schedule_items, :only => [ :new ]  
  def new
    if @tour_day.show_schedule_items.blank?
      Rails.application.config.schedules["show"].each do |d| 
        @tour_day.show_schedule_items.build(:name => d)
      end
    end  
  end
  
  def create
    if @tour_day.update(show_schedule_params)
      redirect_to admin_tour_day_path(@tour_day, :anchor => "show_schedule")
    else
      render 'new'
    end
  end
  
  def show_schedule_params
    params.require(:tour_day).permit( show_schedule_items_attributes: [:name, :for_whom, :start_time, :end_time, :comment])
  end
  
  def find_tour_day
    @tour_day = current_user.tour_days_managed.find(params[:tour_day_id])
  end
  def find_show_schedule_items
    @show_schedule_items = @tour_day.show_schedule_items
  end
end