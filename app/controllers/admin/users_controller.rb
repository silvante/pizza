class Admin::UsersController < AdminController
  def index
    @users = User.where(status: "client")
  end

  def show
    user = User.find(params[:id])
    if user.status == "client"
      @user = user
    else
      redirect_to admin_users_path
    end
  end
end
