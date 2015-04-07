# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create!(
  name: "MadisonRong",
  email: "rongweixin041@gmail.com",
  password: "123456789",
  password_confirmation: "123456789"
)
User.create!(
  name: "Madison",
  email: "madisonrong@glassx.cn",
  password: "123456789",
  password_confirmation: "123456789"
)
# restaurant
# Restaurant.create!(name: "银姐", phone: "34093137")
# Restaurant.create!(name: "银姐意粉屋", phone: "34022832")
# Restaurant.create!(name: "三和", phone: "13798018633,13660444648,13060885021")
# Restaurant.create!(name: "木桶饭", phone: "130730295，13229929944")
# dish type
DishType.create!(name: "饭类")
DishType.create!(name: "小吃")
DishType.create!(name: "糖水")
DishType.create!(name: "饮品")
DishType.create!(name: "焗类")
DishType.create!(name: "牛扒类")
DishType.create!(name: "PIZZA类")
DishType.create!(name: "汤类")
DishType.create!(name: "热饮类")
DishType.create!(name: "面")
DishType.create!(name: "河粉")
DishType.create!(name: "米粉")
DishType.create!(name: "意粉类")
# dish
# require 'roo'
# s = Roo::Excelx.new("BurgerBitch/db/dishes.xlsx")
# sheets_count = s.sheets.count - 1
# 0.upto(sheets_count) do |sheet|
#   s.default_sheet = s.sheets[sheet]
#   row_count = s.last_row - 1
#   # create restaurant
#   restaurant = Restaurant.create!(name: s.cell(1,1), phone: s.cell(s.last_row, 1))
#   3.upto(row_count) do |row|
#     next if s.cell(row, 1).nil?
#     # create dish
#     puts "#{s.cell(row, 1)} #{s.cell(row, 2).sub('元', '')} #{s.cell(row, 3)}"
#     Dish.create!(
#       name: s.cell(row, 1), 
#       price: s.cell(row, 2).sub('元', '').to_i, 
#       dish_type_id: DishType.find_or_create_by(name: s.cell(row, 3)).id,
#       restaurant_id: restaurant.id
#     )
#   end
# end