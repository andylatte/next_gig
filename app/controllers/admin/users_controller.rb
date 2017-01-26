class Admin::UsersController < AdminController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @user.admin_id = current_user.id => replace with crew association
    if @user.valid?
      @user.save!
      flash[:notice] = "Signed up #{@user.email}."
      redirect_to admin_welcome_index_path
    else
      flash[:error] = "something went wrong."
      render :new
    end
end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
    
end
