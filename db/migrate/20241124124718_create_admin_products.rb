class CreateAdminProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :desc
      t.boolean :is_active
      t.integer :price
      t.boolean :is_hit
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
