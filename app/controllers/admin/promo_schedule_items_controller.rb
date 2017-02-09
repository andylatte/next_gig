class Admin::PromoScheduleItemsController < AdminController

  before_action :find_promo_schedule_item, :only => [ :edit, :update, :destroy]
  before_action :find_tour_day, :only => [ :new, :create, :edit, :update, :destroy]
  
  def new
    @promo_schedule_item = PromoScheduleItem.new
  end

  def create
    @promo_schedule_item = PromoScheduleItem.new(promo_schedule_item_params)
    @tour_day.promo_schedule_items << @promo_schedule_item
    if @promo_schedule_item.save
      redirect_to admin_tour_day_path(@tour_day, :anchor => "promo_schedule")
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @promo_schedule_item.update(promo_schedule_item_params)
      redirect_to admin_tour_day_path(@tour_day, :anchor => "promo_schedule")
    else
      render 'edit'
    end
  end
  def destroy
    @promo_schedule_item.destroy
    redirect_to admin_tour_day_path(@tour_day, :anchor => "promo_schedule")
  end
  
  protected

  def find_promo_schedule_item
    @promo_schedule_item = PromoScheduleItem.find(params[:id])
  end  
  
  def find_tour_day
    @tour_day = @promo_schedule_item.nil? ? @tour_day = TourDay.find(params[:tour_day_id]) : @promo_schedule_item.tour_day
  end

  def promo_schedule_item_params
    params.require(:promo_schedule_item).permit(:name, :for_whom, :destination, :start_time, :end_time, :contact, :comment)
  end
end