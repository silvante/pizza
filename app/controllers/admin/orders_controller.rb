class Admin::OrdersController < AdminController
  def index
    @checked_orders = Order.where(status: "checked")
  end
end
