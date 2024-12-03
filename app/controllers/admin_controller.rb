class AdminController < ApplicationController
  before_action :authenticate_admin!
  layout "admin"
  def index
    @deliveries = User.where(status: "delivery")
    @number_of_clients = User.where(status: "client").length
    @number_of_products = Product.all.length
    @number_of_types = Category.all.length
    total_ordered = Order.where(status: "ordered")


    @orders = {
      total: Order.all.length,
      total_delivered: Order.where(status: "delivered").length,
      total_checked: Order.where(status: "cheched").length,
      total_failed: Order.where(status: "failed").length,
      total_revenue: total_ordered.sum { |order| }
    }
  end
end
