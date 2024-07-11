# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# categories/seeds.rb
categories = [
  { name: 'Electronics', description: 'Devices and gadgets' },
  { name: 'Books', description: 'Various genres of books' },
  { name: 'Clothing', description: 'Men and women apparel' },
  { name: 'Home', description: 'Home appliances and furniture' },
  { name: 'Toys', description: 'Toys and games for kids' }
]

categories.each do |category_attrs|
  Category.find_or_create_by(name: category_attrs[:name]) do |category|
    category.description = category_attrs[:description]
  end
end
