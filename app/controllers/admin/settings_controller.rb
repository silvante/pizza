class Admin::SettingsController < AdminController
  before_action :set_setting, only: %i[ update ]
  def index
    @setting = Setting.first
  end

  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to admin_settings_path, notice: "ozgarishlar saqlandi." }
        format.json { render :show, status: :ok, location: @admin_product }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_setting
    @setting = Setting.find(params.expect(:id))
  end

  def setting_params
    params.expect(setting: [ :site_name, :dispatcher_mobile, :site_description, :site_welcome, :banner, :icon, :work_end_time, :work_start_time, :order_price, :order_time, :site_address, :instagram_link ])
  end
end
