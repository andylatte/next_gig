class Admin::ContactsController < AdminController
  before_action :find_contact, :only => [ :edit, :update, :destroy]
  before_action :find_tour_day, :only => [ :new, :create, :edit, :update, :destroy]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @tour_day.contact = @contact
    if @contact.save
      redirect_to admin_tour_day_path(@tour_day, :anchor => "contact")
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to admin_tour_day_path(@tour_day, :anchor => "contact")
    else
      render 'edit'
    end
  end
  def destroy
    @contact.destroy
    redirect_to admin_tour_day_path(@tour_day, :anchor => "contact")
  end

  protected

  def find_contact
    @contact = Contact.find(params[:id])
  end
  def find_tour_day
    @tour_day = @contact.nil? ? @tour_day = current_user.tour_days_managed.find(params[:tour_day_id]) : @contact.tour_day
  end

  def contact_params
    params.require(:contact).permit(:main_contact_name, :main_contact_phone, :main_contact_email, :prod_contact_name, :prod_contact_phone, :prod_contact_email, :hosp_contact_name, :hosp_contact_phone, :hosp_contact_email, :stage_manager_name, :stage_manager_phone, :stage_manager_email)
  end
end
