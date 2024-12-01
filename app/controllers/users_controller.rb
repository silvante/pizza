class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def history
    user = User.find(params[:id])
    @orders = user.order.where(user: current_user)
  end
end
