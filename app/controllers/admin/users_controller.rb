class Admin::UsersController < AdminController
  skip_before_filter :verify_authenticity_token, :only => :create
  def index
    @crew_members_available = current_user.crew_members_available
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save!
      current_user.crew_members_available << @user
      flash[:notice] = "Signed up #{@user.email}."
      redirect_to admin_users_path
    else
      flash[:error] = "something went wrong."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render 'edit'
    end
  end  

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to admin_users_path
  end
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
      
end
