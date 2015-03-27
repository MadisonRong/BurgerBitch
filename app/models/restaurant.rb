class Restaurant < ActiveRecord::Base
  has_many :dishes

  ***REMOVED*** 获取所有的餐厅
  scope :get_restaurant, ->(){
    select(:id, :name).all
  }

  scope :get_dishes, ->(restaurant_id){
    dishes = Restaurant.find(restaurant_id).dishes.order('id, dish_type_id')
    dishes_hash = Hash.new
    dishes.each do |dish|
      
    end
  }
end
