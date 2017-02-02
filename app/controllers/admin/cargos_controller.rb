class Admin::CargosController < AdminController
    before_action :find_cargo, :only => [ :edit, :update, :destroy]
    before_action :find_tour_day, :only => [ :new, :create, :edit, :update, :destroy]

    def new
      @cargo = Cargo.new
    end

    def create
      @cargo = Cargo.new(cargo_params)
      @tour_day.cargo = @cargo
      if @cargo.save
        redirect_to admin_tour_day_path(@tour_day)
      else
        render "new"
      end
    end

    def edit
    end

    def update
      if @cargo.update(cargo_params)
        redirect_to admin_tour_day_path(@tour_day)
      else
        render 'edit'
      end
    end
    def destroy
      @cargo.destroy
      redirect_to admin_tour_day_path(@tour_day)
    end

    protected

    def find_cargo
      @cargo = Cargo.find(params[:id])
    end  
    def find_tour_day
      @tour_day = @cargo.nil? ? @tour_day = TourDay.find(params[:tour_day_id]) : @cargo.tour_day
    end

    def cargo_params
      params.require(:cargo).permit(:time_drop_off,:contact_drop_off, :licence_plate_drop_off,:amount_drop_off, :time_pick_up, :contact_pick_up, :licence_plate_pick_up, :amount_pick_up, :comment)
    end
  end  