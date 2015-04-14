***REMOVED*** This file should contain all the record creation needed to seed the database with its default values.
***REMOVED*** The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
***REMOVED***
***REMOVED*** Examples:
***REMOVED***
***REMOVED***   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
***REMOVED***   Mayor.create(name: 'Emanuel', city: cities.first)

***REMOVED*** admin
Admin.create!(
  name: "MadisonRong",
  email: "rongweixin041@gmail.com",
  password: "123456789",
  password_confirmation: "123456789"
)

***REMOVED*** dish type
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
