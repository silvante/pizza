class Admin::SettingsController < AdminController
  def index
    @setting = Setting.first
  end

  def update
  end

  private

  def set_setting
    @setting = Setting.find(params.expect(:id))
  end

  def setting_params
    params.expect(setting: [ :site_name, :site_description, :site_welcome, :banner, :icon, :work_end_time, :work_start_time, :order_price, :order_time, :site_address, :instagram_link ])
  end
end
