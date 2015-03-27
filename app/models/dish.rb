class Dish < ActiveRecord::Base
  belongs_to :dish_type
  belongs_to :restaurant
  has_many :orders
end
