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
        redirect_to admin_tour_day_path(@tour_day)
      else
        render "new"
      end
    end

    def edit
    end

    def update
      if @production.update(production_params)
        redirect_to admin_tour_day_path(@tour_day)
      else
        render 'edit'
      end
    end
    def destroy
      @production.destroy
      redirect_to admin_tour_day_path(@tour_day)
    end

    protected

    def find_production
      @production = Production.find(params[:id])
    end  
    def find_tour_day
      @tour_day = @production.nil? ? @tour_day = TourDay.find(params[:tour_day_id]) : @production.tour_day
    end

    def production_params
      params.require(:production).permit(:main_contact_name, :main_contact_phone, :main_contact_email, :prod_contact_name, :prod_contact_phone, :prod_contact_email, :hosp_contact_name, :hosp_contact_phone, :hosp_contact_email, :stage_manager_name, :stage_manager_phone, :stage_manager_email, :stage_size, :local_backline, :access_notes, :loading_notes, :credential_notes, :comment)
    end
  end