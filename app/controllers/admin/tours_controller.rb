class Admin::ToursController < AdminController
  
  before_action :find_tour, :only => [:edit, :update, :destroy, :assign_crew_members, :update_crew_members]

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
    @crew_members_on_tour = @tour.crew_members
    @crew_members_available = current_user.crew_members_available
  end

  def update_crew_members
  end
  
  protected
  
  def find_tour
    @tour = Tour.find(params[:id])
  end
  
  def tour_params
     params.require(:tour).permit(:tour_name, :band_name)
  end
end
