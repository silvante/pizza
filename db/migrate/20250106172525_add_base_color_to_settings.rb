class AddBaseColorToSettings < ActiveRecord::Migration[8.0]
  def change
    add_column :settings, :base_color, :string
  end
end
