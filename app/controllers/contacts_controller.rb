class ContactsController < ApplicationController

  layout "crew"

  before_action :find_tour_day, :only => [:show]

  def show
    @contact = Contact.find(params[:id])
  end

  def find_tour_day
    @tour_day = current_user.tour_days.find(params[:tour_day_id])
  end
end
