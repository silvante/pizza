class CreateSettings < ActiveRecord::Migration[8.0]
  def change
    create_table :settings do |t|
      t.string :site_name
      t.text :site_description
      t.string :site_welcome
      t.string :order_time
      t.time :work_start_time
      t.time :work_end_time
      t.string :site_address
      t.string :instagram_link
      t.integer :order_price

      t.timestamps
    end
  end
end
