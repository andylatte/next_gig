class Admin::WelcomeController < AdminController
  def index
    @users = User.all
  end
end
