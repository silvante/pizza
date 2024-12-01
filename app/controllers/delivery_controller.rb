class DeliveryController < ApplicationController
  before_action :authenticate_delivery!
  layout "delivery"
  def show
    @delivery = User.find(params[:id])
    @total_delivered_orders = Order.where(delivery: @delivery.id, status: "delivered")
    @ordered_today = Order.where(updated_at: Time.zone.today.all_day, status: "delivered")
    @orders = Order.where(delivery: @delivery.id, status: "complate")
    admin = User.find_by(status: "admin")
    @admin_mobile = admin.mobile
  end

  def success
    @order = Order.find(params[:id])

    if @order.update(status: "delivered")
      redirect_to delivery_path(@order.delivery), notice: "Buyurtma yetkazib berildi! :)"
    end
  end

  def failed
    @order = Order.find(params[:id])

    if @order.update(status: "failed")
      redirect_to delivery_path(@order.delivery), notice: "Buyurtma yetkazib berilmadi! :("
    end
  end
end
