class Admin::WelcomeController < AdminController
  def index
    @tours = current_user.tours_managed
  end
end
