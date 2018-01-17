# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#create user admin
User.create(email: "admin@example.com", password: "admin123", role: 'admin')
puts "Default admin created!"


#create category seed
Category.destroy_all

category_list = [
  { name: "早午餐下午茶" },
  { name: "燒烤 BBQ" },
  { name: "就i吃到飽" },
  { name: "鐵板燒" },
  { name: "鍋物寶典" },
  { name: "居酒屋" },
  { name: "韓式料理" },
  { name: "泰式料理" },
  { name: "美式料理" },
  { name: "日本料理" }
]

category_list.each do |category|
  Category.create( name: category[:name] )
end
puts "Category Created!"