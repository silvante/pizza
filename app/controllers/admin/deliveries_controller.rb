class Admin::DeliveriesController < AdminController
  def index
    @deliveries = User.where(status: "delivery")
  end

  def new
    @delivery_worker = User.new
  end

  def create
    @delivery_worker = User.new(delivery_worker_params)
    @delivery_worker.status = "delivery"

    respond_to do |format|
      if @delivery_worker.save
        format.html { redirect_to admin_deliveries_path, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: :admin_deliveries_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @delivery_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @delivery = User.find(params[:id])
    @delivery.destroy

    respond_to do |format|
      format.html { redirect_to admin_deliveries_path, status: :see_other, notice: "Hodim muaffaqiyatli ishdan boshatildi" }
      format.json { head :no_content }
    end
  end

  private

  def delivery_worker_params
    params.expect(user: [ :name, :email, :password, :born_in, :mobile ])
  end
end
