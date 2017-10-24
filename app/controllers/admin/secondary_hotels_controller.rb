class Admin::SecondaryHotelsController < AdminController
  before_action :find_secondary_hotel, :only => [ :edit, :update, :destroy]
  before_action :find_tour_day, :only => [ :new, :create, :edit, :update, :destroy]
  
  def new
    @secondary_hotel = SecondaryHotel.new
  end

  def create
    @secondary_hotel = @tour_day.build_secondary_hotel(secondary_hotel_params)
    if @secondary_hotel.save
      redirect_to admin_tour_day_path(@tour_day, :anchor => "secondary_hotel")
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @secondary_hotel.update(secondary_hotel_params)
      redirect_to admin_tour_day_path(@tour_day, :anchor => "secondary_hotel")
    else
      render 'edit'
    end
  end
  def destroy
    @secondary_hotel.destroy
    redirect_to admin_tour_day_path(@tour_day, :anchor => "secondary_hotel")
  end
  
  protected

  def find_secondary_hotel
    @secondary_hotel = SecondaryHotel.find(params[:id])
  end  
  def find_tour_day
    @tour_day = @secondary_hotel.nil? ? @tour_day = current_user.tour_days_managed.find(params[:tour_day_id]) : @secondary_hotel.tour_day
  end

  def secondary_hotel_params
    params.require(:secondary_hotel).permit(:hotel_name, :address_1, :address_2, :zip_code, :city, :country, :check_in_date, :check_out_date, :number_of_nights, :single_rooms, :twin_rooms, :breakfast, :comment)
  end
end
