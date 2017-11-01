class Admin::PrimaryHotelsController < AdminController
  before_action :find_primary_hotel, :only => [ :edit, :update, :destroy]
  before_action :find_tour_day, :only => [ :new, :create, :edit, :update, :destroy]

  def new
    @primary_hotel = PrimaryHotel.new
  end

  def create
    @primary_hotel = @tour_day.build_primary_hotel(primary_hotel_params)
    if @primary_hotel.save
      redirect_to admin_tour_day_path(@tour_day, :anchor => "hotels")
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @primary_hotel.update(primary_hotel_params)
      redirect_to admin_tour_day_path(@tour_day, :anchor => "hotels")
    else
      render 'edit'
    end
  end
  def destroy
    @primary_hotel.destroy
    redirect_to admin_tour_day_path(@tour_day, :anchor => "hotels")
  end

  protected

  def find_primary_hotel
    @primary_hotel = PrimaryHotel.find(params[:id])
  end
  def find_tour_day
    @tour_day = @primary_hotel.nil? ? @tour_day = current_user.tour_days_managed.find(params[:tour_day_id]) : @primary_hotel.tour_day
  end

  def primary_hotel_params
    params.require(:primary_hotel).permit(:hotel_name, :address_1, :address_2, :zip_code, :city, :country, :check_in_date, :check_out_date, :number_of_nights, :single_rooms, :twin_rooms, :breakfast, :comment)
  end
end
