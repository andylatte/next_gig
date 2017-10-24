class Admin::DriverHotelsController < AdminController
  before_action :find_driver_hotel, :only => [ :edit, :update, :destroy]
  before_action :find_tour_day, :only => [ :new, :create, :edit, :update, :destroy]
  
  def new
    @driver_hotel = DriverHotel.new
  end

  def create
    @driver_hotel = @tour_day.build_driver_hotel(driver_hotel_params)
    if @driver_hotel.save
      redirect_to admin_tour_day_path(@tour_day, :anchor => "driver_hotel")
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @driver_hotel.update(driver_hotel_params)
      redirect_to admin_tour_day_path(@tour_day, :anchor => "driver_hotel")
    else
      render 'edit'
    end
  end
  def destroy
    @driver_hotel.destroy
    redirect_to admin_tour_day_path(@tour_day)
  end
  
  protected

  def find_driver_hotel
    @driver_hotel = DriverHotel.find(params[:id])
  end  
  def find_tour_day
    @tour_day = @driver_hotel.nil? ? @tour_day = current_user.tour_days_managed.find(params[:tour_day_id]) : @driver_hotel.tour_day
  end

  def driver_hotel_params
    params.require(:driver_hotel).permit(:hotel_name, :address_1, :address_2, :zip_code, :city, :country, :check_in_date, :check_out_date, :number_of_nights, :single_rooms, :twin_rooms, :breakfast, :comment)
  end
end
