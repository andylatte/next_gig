class Admin::ShowScheduleItemsController < AdminController

  before_action :find_show_schedule_item, :only => [ :edit, :update, :destroy]
  before_action :find_tour_day, :only => [ :new, :create, :edit, :update, :destroy]
  
  def new
    @show_schedule_item = ShowScheduleItem.new
  end

  def create
    @show_schedule_item = ShowScheduleItem.new(show_schedule_item_params)
    @tour_day.show_schedule_items << @show_schedule_item
    if @show_schedule_item.save
      redirect_to admin_tour_day_path(@tour_day, :anchor => "show_schedule")
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @show_schedule_item.update(show_schedule_item_params)
      redirect_to admin_tour_day_path(@tour_day, :anchor => "show_schedule")
    else
      render 'edit'
    end
  end
  def destroy
    @show_schedule_item.destroy
    redirect_to admin_tour_day_path(@tour_day, :anchor => "show_schedule")
  end
  
  protected

  def find_show_schedule_item
    @show_schedule_item = ShowScheduleItem.find(params[:id])
  end  
  
  def find_tour_day
    @tour_day = @show_schedule_item.nil? ? @tour_day = current_user.tour_days_managed.find(params[:tour_day_id]) : @show_schedule_item.tour_day
  end

  def show_schedule_item_params
    params.require(:show_schedule_item).permit(:name, :for_whom, :start_time, :end_time, :comment)
  end
end






