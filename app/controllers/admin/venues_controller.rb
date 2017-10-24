class Admin::VenuesController < AdminController
  
  before_action :find_venue, :only => [ :edit, :update, :destroy]
  before_action :find_tour_day, :only => [ :new, :create, :edit, :update, :destroy]
  
  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @tour_day.venue = @venue
    if @venue.save
      redirect_to admin_tour_day_path(@tour_day, :anchor => "venue")
    else
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if @venue.update(venue_params)
      redirect_to admin_tour_day_path(@tour_day, :anchor => "venue")
    else
      render 'edit'
    end
  end
  def destroy
    @venue.destroy
    redirect_to admin_tour_day_path(@tour_day, :anchor => "venue")
  end
  
  protected

  def find_venue
    @venue = Venue.find(params[:id])
  end  
  def find_tour_day
    @tour_day = @venue.nil? ? @tour_day = current_user.tour_days_managed.find(params[:tour_day_id]) : @venue.tour_day
  end

  def venue_params
    params.require(:venue).permit(:venue_name, :address_1, :address_2, :zip_code, :city, :country, :url, :venue_type, :slot, :stage, :capacity, :sales, :comment)
  end
end


