class Admin::WelcomeController < AdminController
  def index
    @tours = current_user.managed_tours
  end
end
