class Admin::WelcomeController < AdminController
  def index
    @tours = (current_user.tours_assigned + current_user.tours_managed).uniq
  end
end
