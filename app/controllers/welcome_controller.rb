class WelcomeController < ApplicationController
  def index
    if current_user.admin?
      redirect_to admin_welcome_index_path
    end
  end
end
