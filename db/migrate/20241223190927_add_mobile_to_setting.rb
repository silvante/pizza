class AddMobileToSetting < ActiveRecord::Migration[8.0]
  def change
    add_column :settings, :dispatcher_mobile, :integer
  end
end
