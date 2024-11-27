class AddOrderCodeToOrder < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :order_code, :integer
  end
end
