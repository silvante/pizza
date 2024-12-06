class AdminController < ApplicationController
  before_action :authenticate_user!
  layout "admin"
  def index
    @deliveries = User.where(status: "delivery")
    @number_of_clients = User.where(status: "client").length
    @number_of_products = Product.all.length
    @number_of_types = Category.all.length
    total_ordered = Order.where(status: "ordered")

    def format_revenue(number)
      number.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
    end

    @total_revenue = format_revenue(total_revenue)
    @revenue_for_month = format_revenue(revenue_for_month)
    @revenue_for_day = format_revenue(revenue_for_day)


    @orders = {
      total: Order.all.length,
      total_delivered: Order.where(status: "delivered").length,
      total_checked: Order.where(status: "checked").length,
      total_failed: Order.where(status: "failed").length,
      total_revenue: total_ordered.sum { |order| }
    }
  end

  private

  # Calculate total revenue
  def total_revenue
    OrderProduct.joins(:product).sum("order_products.amount * products.price")
  end

  # Calculate revenue for the current month
  def revenue_for_month
    OrderProduct.joins(:product)
                .where(created_at: Time.current.beginning_of_month..Time.current.end_of_month)
                .sum("order_products.amount * products.price")
  end

  # Calculate revenue for the current day
  def revenue_for_day
    OrderProduct.joins(:product)
                .where(created_at: Time.current.beginning_of_day..Time.current.end_of_day)
                .sum("order_products.amount * products.price")
  end
end
