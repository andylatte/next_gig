class Admin::ToursController < AdminController
  
  before_action :find_tour, :only => [:edit, :show, :update, :destroy, :assign_crew_members, :update_crew_members]
  before_action :find_crew_members, :only => [:show]
  before_action :find_tour_days, :only => [:show]

  def show
  end
 
  def new
    @tour = Tour.new
  end

  def create
    @tour = current_user.tours_managed.build(tour_params)
    if @tour.valid?
      @tour.save!
      flash[:notice] = "Tour created#{@tour.tour_name}."
      redirect_to admin_welcome_index_path
    else
      flash[:error] = "something went wrong."
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @tour.update(tour_params)
      redirect_to admin_welcome_index_path
    else
      render 'edit'
    end
  end  

  def destroy
    @tour.destroy

    redirect_to admin_welcome_index_path
  end
  
  def assign_crew_members
    @crew_members_available = current_user.crew_members_available
  end

  def update_crew_members
    @tour.crew_member_ids = tour_params[:crew_member_ids]
    redirect_to admin_tour_path(@tour)
  end
  
  protected
  
  def find_tour
    @tour = current_user.tours_managed.find(params[:id])
  end
  
  def find_tour_days
    @tour_days = @tour.tour_days
  end
  
  def find_crew_members
    @crew_members = @tour.crew_members
  end
  
  def tour_params
     params.require(:tour).permit(:tour_name, :band_name, {:crew_member_ids => []})
  end
end
