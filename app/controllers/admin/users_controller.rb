class Admin::UsersController < AdminController
  def index
    @users = User.where(status: "client")
  end

  def show
    @user = User.find(params[:id])
  end
end
