class Admin::TravelScheduleItemsController < AdminController
  before_action :find_travel_schedule_item, :only => [ :edit, :update, :destroy]
  before_action :find_tour_day, :only => [ :new, :create, :edit, :update, :destroy]
  
  def new
    @travel_schedule_item = TravelScheduleItem.new
  end

  def create
    @travel_schedule_item = TravelScheduleItem.new(travel_schedule_item_params)
    @tour_day.travel_schedule_items << @travel_schedule_item
    if @travel_schedule_item.save
      redirect_to admin_tour_day_path(@tour_day)
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @travel_schedule_item.update(travel_schedule_item_params)
      redirect_to admin_tour_day_path(@tour_day)
    else
      render 'edit'
    end
  end
  def destroy
    @travel_schedule_item.destroy
    redirect_to admin_tour_day_path(@tour_day)
  end
  
  protected

  def find_travel_schedule_item
    @travel_schedule_item = TravelScheduleItem.find(params[:id])
  end  
  
  def find_tour_day
    @tour_day = @travel_schedule_item.nil? ? @tour_day = TourDay.find(params[:tour_day_id]) : @travel_schedule_item.tour_day
  end

  def travel_schedule_item_params
    params.require(:travel_schedule_item).permit(:name, :for_whom, :number, :origin, :destination, :start_time, :departure_date_time, :arrival_date_time, :duration, :comment)
  end
end



