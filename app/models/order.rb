class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :dish
  has_one :restaurant, through: :dish

  # 下单
  scope :make_an_order, ->(dish_id, current_user_id){ 
    Order.create!(user_id: current_user_id, dish_id: dish_id)
  }

  # 前台查看个人的订餐情况
  scope :get_orders, ->(current_user_id){
    orders = User.find(current_user_id).orders.includes("dish", "restaurant").order("id desc")
    orders_array = Array.new
    orders.each do |order|
      order_hash = Hash.new
      order_hash[:id] = order.id
      order_hash[:restaurant] = order.restaurant.name
      order_hash[:name] = order.dish.name
      order_hash[:price] = order.dish.price
      order_hash[:time] = order.created_at
      orders_array << order_hash
    end
    return orders_array
  }

  # 检查是否到订餐时间和某用户在订餐时间内的订餐个数
  scope :has_order?, ->(current_user_id){
    times = get_times
    order_count = 0
    if times[4] > times[0] 
      if times[4] < times[1]
        order_count = User.find(current_user_id).orders.between_times(Time.parse(times[0]).utc, Time.parse(times[1]).utc).count
        puts "lunch"
        return order_count
      end
    else
      # 未到午饭订餐时间
      return -5
    end
    if times[4] > times[1] && times[4] < times[2]
      # 过了午饭订餐时间，未到晚饭订餐时间
      return -4
    end
    if times[4] > times[2] 
      if times[4] < times[3]
        order_count = User.find(current_user_id).orders.between_times(Time.parse(times[2]).utc, Time.parse(times[3]).utc).count
        puts "dinner"
        return order_count
      else
        # 已过了晚饭订餐时间
        return -3
      end
    else
      # 未到晚饭订餐时间
      return -4
    end
    return order_count
  }

  # 查看订餐情况
  scope :check_it_out, ->(date, meal){
    times = get_times
    orders = Array.new
    # 午饭时间
    if meal == "0"
      orders = Order.includes("dish", "user", "restaurant").between_times(Time.parse(date + " 10:00").utc, Time.parse(date + " 11:30").utc).order("dish_id")
    end
    # 晚饭时间
    if meal =="1"
      orders = Order.includes("dish", "user", "restaurant").between_times(Time.parse(date + " 16:00").utc, Time.parse(date + " 17:30").utc).order("dish_id")
    end
    # orders = Order.includes("dish", "user").between_times(Time.parse('2015-04-02 00:00:00').utc, Time.parse('2015-04-02 10:00:00').utc).order("dish_id")
    sum = 0
    result_hash = Hash.new
    result_array = Array.new
    orders.each do |order|
      # 当前订单中菜式对应的餐馆
      restaurant = order.restaurant
      iterator = has_restaurant?(result_array, restaurant.id)
      # 当前餐馆存在列表里时，往对应餐馆对象的菜式列表加入数据
      if iterator >= 0
        dishes_hash = result_array[iterator][:dishes]
        # 当前菜式列表里是否有相同的菜式
        flag = false
        dishes_hash.each do |dish|
          if order.dish.id == dish[:id] && order.dish.price == dish[:price]
            # 找到相同的菜式，数量+1，加入用户名字，把标识设为true
            dish[:count] += 1
            dish[:users] << order.user.real_name
            sum += order.dish.price
            flag = true
            break
          end
        end
        # 找不到相同的菜式，新加一个进列表
        unless flag
          dish_hash = Hash.new
          dish_hash[:id] = order.dish.id
          dish_hash[:dish_name] = order.dish.name
          dish_hash[:count] = 1
          dish_hash[:price] = order.dish.price
          dish_hash[:users] = Array[order.user.real_name]
          dishes_hash << dish_hash
          sum += order.dish.price
        end
      else
        # 当前餐馆不存在时，新建一个餐馆对象存储菜式
        restaurant_hash = Hash.new
        dish_array = Array.new
        dish_hash = Hash.new
        dish_hash[:id] = order.dish.id
        dish_hash[:dish_name] = order.dish.name
        dish_hash[:count] = 1
        dish_hash[:price] = order.dish.price
        dish_hash[:users] = Array[order.user.real_name]
        dish_array << dish_hash
        restaurant_hash[:id] = restaurant.id
        restaurant_hash[:restaurant_name] = restaurant.name
        restaurant_hash[:phone] = restaurant.phone
        restaurant_hash[:dishes] = dish_array
        result_array << restaurant_hash
        sum += order.dish.price
      end
    end
    result_hash[:orders] = result_array
    result_hash[:total] = sum
    return result_hash
  }

  # 计算本月金额
  scope :sum_this_month, ->(current_user_id){
    sum_order = User.find(current_user_id).orders.includes("dish").by_month.sum("price")
  }

  # 查看历史记录
  scope :get_all, ->(params){
    orders = Order.includes("dish", "user", "restaurant").limit(params[:length]).offset(params[:start])
    orders_count = Order.includes("dish", "user", "restaurant").count
    data = Array.new
    orders.each do |order|
      order_hash = Hash.new
      order_hash[:id] = order.id
      order_hash[:restaurant] = order.restaurant.name
      order_hash[:name] = order.dish.name
      order_hash[:price] = order.dish.price
      order_hash[:user] = order.user.real_name
      order_hash[:time] = order.created_at
      data << order_hash
    end
    result_hash = Hash.new
    result_hash[:draw] = params[:draw]
    result_hash[:start] = params[:start]
    result_hash[:length] = params[:length]
    result_hash[:recordTotal] = orders_count
    result_hash[:resordFiltered] = orders_count
    result_hash[:data] = data
    return result_hash
  }

  # 获取午饭，晚饭时间
    def self.get_times
      time = Time.now
      now_time = time.to_s
      time1 = time.strftime("%Y-%m-%d 10:00:00")
      time2 = time.strftime("%Y-%m-%d 11:30:00")
      time3 = time.strftime("%Y-%m-%d 16:00:00")
      time4 = time.strftime("%Y-%m-%d 17:30:00")
      return Array[time1, time2, time3, time4, now_time]
    end

    # 判断数组中是否有某餐馆的菜式列表
    def self.has_restaurant?(result_array, restaurant_id)
      result_array.each do |restaurant|
        if restaurant[:id] == restaurant_id
          return result_array.index(restaurant)
          break
        end
      end
      return -1
    end
end
