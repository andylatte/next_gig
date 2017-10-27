class Admin::ProductionsController < AdminController
  before_action :find_production, :only => [ :edit, :update, :destroy]
  before_action :find_tour_day, :only => [ :new, :create, :edit, :update, :destroy]

  def new
    @production = Production.new
  end

  def create
    @production = Production.new(production_params)
    @tour_day.production = @production
    if @production.save
      redirect_to admin_tour_day_path(@tour_day, :anchor => "production")
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @production.update(production_params)
      redirect_to admin_tour_day_path(@tour_day, :anchor => "production")
    else
      render 'edit'
    end
  end
  def destroy
    @production.destroy
    redirect_to admin_tour_day_path(@tour_day, :anchor => "production")
  end

  protected

  def find_production
    @production = Production.find(params[:id])
  end
  def find_tour_day
    @tour_day = @production.nil? ? @tour_day = current_user.tour_days_managed.find(params[:tour_day_id]) : @production.tour_day
  end

  def production_params
    params.require(:production).permit(:stage_size, :local_backline, :access_notes, :loading_notes, :credential_notes, :comment)
  end
end
