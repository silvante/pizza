class OrdersController < ApplicationController
  before_action :authenticate_client!
  def destroy
    @order = Order.find(params[:id])
    @order.order_products.destroy_all
    @order.destroy!
    respond_to do |format|
      format.html { redirect_to cart_index_path, status: :see_other, notice: "Savatcha tozalandi" }
      format.json { head :no_content }
    end
  end

  def checkout
    @order = Order.find(params[:id])
    if @order.update(status: "checked", address: params[:address])
      ActionCable.server.broadcast "order_channel", {
        order_id: @order.id,
        status: @order.status,
        order_data: render_to_string(partial: "admin/orders/order", locals: { order: @order })
      }
      redirect_to order_path(@order), notice: "zakaz jonatildi, qongiroqni kuting"
    else
      redirect_to cart_path, notice: "zakaz jonatilmadi, qayta urinib koring"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  # def set_order
  #   @order = Order.find(params[:id])
  # end
end
