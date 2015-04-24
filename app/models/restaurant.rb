class Restaurant < ActiveRecord::Base
  has_many :dishes
  has_many :orders, through: :dishes

  # 获取所有的餐厅
  scope :get_restaurant, ->{ select(:id, :name).all }

  # 根据餐厅获取对应菜单
  scope :get_dishes, ->(restaurant_id){
    dishes = Restaurant.find(restaurant_id).dishes.includes("dish_type").order('dish_type_id, id, price')
    # 分类展示菜式
    dishes_hash = Hash.new
    iterator = 0
    dishes_size = dishes.size
    result_hash = Hash.new
    result_array = Array.new
    while iterator < dishes_size
      if iterator ==0
        logger.info "the first one is: #{dishes[iterator].name}##{dishes[iterator].dish_type.name}"
        # 第一个元素，直接入数组
        result_array << dishes[iterator]
        iterator += 1
        next
      end
      if iterator + 1 == dishes_size
        logger.info "the last one is: #{dishes[iterator].name}##{dishes[iterator].dish_type.name}"
        # 最后一个元素，给hash赋值并加入数组，同时防止数组越界
        if result_hash[dishes[iterator].dish_type.name.to_s].nil? 
          result_hash[dishes[iterator].dish_type.name.to_s] = result_array
        else
          result_hash[dishes[iterator].dish_type.name.to_s] += result_array
        end
        result_array << dishes[iterator]
        # 判断当前菜式的类型是否与前一个不相同
        # if dishes[iterator].dish_type.name != dishes[iterator - 1].dish_type.name
        #   # 不相同，将前面积累的数组赋值给对应的hash
        #   if result_hash[dishes[iterator - 1].dish_type.name.to_s].nil?
        #     result_hash[dishes[iterator - 1].dish_type.name.to_s] = result_array
        #   else
        #     result_hash[dishes[iterator - 1].dish_type.name.to_s] += result_array
        #   end
        #   # 开辟新数组储存接下来的元素
        #   result_array = Array.new
        #   # 将当前值加入数组
        #   result_array << dishes[iterator]
        #   result_hash[dishes[iterator].dish_type.name.to_s] = result_array
        # else
        #   # 相同则直接加入数组，并且将数组赋值给hash
        #   result_array << dishes[iterator]
        #   result_hash[dishes[iterator - 1].dish_type.name.to_s] = result_array
        # end
        iterator += 1
        next
      end
      logger.info "#{dishes[iterator].name}##{dishes[iterator].dish_type.name}"
      # 判断当前菜式的类型是否与前一个不相同
      if dishes[iterator].dish_type.name != dishes[iterator - 1].dish_type.name
        # 不相同，将前面积累的数组赋值给对应的hash
        if result_hash[dishes[iterator - 1].dish_type.name.to_s].nil?
          result_hash[dishes[iterator - 1].dish_type.name.to_s] = result_array
        else
          result_hash[dishes[iterator - 1].dish_type.name.to_s] += result_array
        end
        # 开辟新数组储存接下来的元素
        result_array = Array.new
        # 将当前值加入数组
        result_array << dishes[iterator]
      else
        # 相同则直接加入数组，直至不相同才将数组赋值给hash
        result_array << dishes[iterator]
      end
      iterator += 1
    end
    return result_hash
  }
end
