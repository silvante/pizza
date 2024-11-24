json.extract! admin_product, :id, :title, :desc, :is_active, :price, :is_hit, :category_id, :created_at, :updated_at
json.url admin_product_url(admin_product, format: :json)
