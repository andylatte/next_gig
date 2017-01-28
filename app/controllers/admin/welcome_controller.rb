class Admin::WelcomeController < AdminController
  def index
    @crew_members = current_user.crew_members
  end
end
