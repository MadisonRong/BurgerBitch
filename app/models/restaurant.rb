class Restaurant < ActiveRecord::Base
  has_many :dishes

  ***REMOVED*** 获取所有的餐厅
  scope :get_restaurant, ->(){
    select(:id, :name).all
  }

  ***REMOVED*** 根据餐厅获取对应菜单
  scope :get_dishes, ->(restaurant_id){
    dishes = Restaurant.find(restaurant_id).dishes.order('id, dish_type_id')
    ***REMOVED*** 分类展示菜式
    dishes_hash = Hash.new
    iterator = 0
    dishes_size = dishes.size
    result_hash = Hash.new
    result_array = Array.new
    while iterator < dishes_size
      if iterator ==0
        ***REMOVED*** 第一个元素，直接入数组
        result_array << dishes[iterator]
        next
      end
      if iterator + 1 == dishes_size
        ***REMOVED*** 最后一个元素，给hash赋值并加入数组，同时防止数组越界
        result_hash[dishes[iterator].dish_type.name.to_s] = result_array
        result_array << dishes[iterator]
        next
      end
      ***REMOVED*** 判断当前菜式的类型是否与前一个不相同
      if dishes[iterator].dish_type.name != dishes[iterator - 1].dish_type.name
        ***REMOVED*** 不相同，将前面积累的数组赋值给对应的hash
        result_hash[dishes[iterator - 1].dish_type.name.to_s] = result_array
        ***REMOVED*** 开辟新数组储存接下来的元素
        result_array = Array.new
        ***REMOVED*** 将当前值加入数组
        result_array << dishes[iterator]
      else
        ***REMOVED*** 相同则直接加入数组，直至不相同才将数组赋值给hash
        result_array << dishes[iterator]
      end
      iterator += 1
    end
  }
end
