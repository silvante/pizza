class AddAddressAndDeliveryToOrder < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :delivery, :integer
    add_column :orders, :address, :string
  end
end
