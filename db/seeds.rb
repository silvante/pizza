# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

User.create(name: "Manager", email: "admin@we.com", password: "admin1234", status: "admin", mobile: "333038282", born_in: 2000)
Setting.create(site_name: "PizzApp", site_welcome: "Welcome to PizzApp", site_description: "every thing has high quality and cheap!", order_time: "00:15:05", work_start_time: Time.new(2000, 1, 1, 9, 0), work_end_time: Time.new(2000, 1, 1, 23, 0), site_address: "baliqchi", instagram_link: "instagram", order_price: 10000)
