class Admin::UsersController < AdminController
  def index
    @users = User.where(status: "client")
  end

  def show
    user = User.find(params[:id])
    if user.status == "client"
      @user = user
      @orders = @user.order.select { |order| order.status == "delivered" }
      @order_length = @orders.length
      @product_length = @orders.sum { |o| o.order_products.sum { |op| op.amount } }
      @total_spent = @orders.sum { |o| o.order_products.sum { |op| op.amount * op.product.price } }
    else
      redirect_to admin_users_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.status != "client"
      redirect_to admin_users_path
    else
      @user.destroy!
      respond_to do |format|
        format.html { redirect_to admin_users_path, notice: "Mijon Muafffaqiyatli ochirildi" }
        format.json { head :no_content }
      end
    end
  end
end
