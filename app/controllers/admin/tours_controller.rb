class Admin::ToursController < AdminController
  def new
    @tour = Tour.new
  end

  def create
    @tour = current_user.managed_tours.build(tour_params)
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
    @tour = Tour.find(params[:id])
  end
  
  def update
    @tour = Tour.find(params[:id])

    if @tour.update(tour_params)
      redirect_to admin_welcome_index_path
    else
      render 'edit'
    end
  end  

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy

    redirect_to admin_welcome_index_path
  end
  
  


  def tour_params
     params.require(:tour).permit(:tour_name, :band_name)
  end
end
