class Admin::OrdersController < AdminController
  def index
    @checked_orders = Order.where(status: "checked")
    @delivery_workers = User.where(status: "delivery")
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to admin_orders_path, status: :see_other, notice: "Buyurtma bekor qilindi" }
      format.json { head :no_content }
    end
  end

  def commit
    @order = Order.find(params[:id])
    if @order.update(status: "complate", delivery: params[:delivery].to_i)
      ActionCable.server.broadcast "order_channel", {
        order_id: @order.id,
        status: @order.status,
        order_data: render_to_string(partial: "delivery/order", locals: { order: @order })
      }
      redirect_to admin_orders_path, notice: "zakaz jonatildi, qongiroqni kuting"
    else
      redirect_to cart_path, notice: "zakaz jonatilmadi, qayta urinib koring"
    end
  end

  def failed
    @order = Order.find(params[:id])

    if @order.update(status: "failed")
      redirect_to admin_orders_path, notice: "Buyurtma bekor qilindi!"
    end
  end
end
