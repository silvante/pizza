class Admin::DeliveriesController < AdminController
  def index
  end

  def new
    @delivery_worker = User.new
  end

  def create
    @delivery_worker = User.new(delivery_worker_params)
    @delivery_worker.status = "delivery"

    respond_to do |format|
      if @delivery_worker.save
        format.html { redirect_to admin_categories_path, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: :admin_deliveries_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def delivery_worker_params
    params.expect(user: [ :name, :email, :password, :born_in, :mobile ])
  end
end
