module OrdersHelper

  # 判断是否可以取消订单
  def can_del?(order_time)
    order_time = order_time.to_i
    time = Time.now
    now_time = time.to_s
    # lunch
    time1 = Time.parse(time.strftime("%Y-%m-%d 14:00:00")).to_i
    # dinner
    time2 = Time.parse(time.strftime("%Y-%m-%d 18:00:00")).to_i
    time = time.to_i
    # 订餐时间为2pm前并且当前时间未超过2pm
    if time < time1 && order_time < time1
      return true
    end
    # 订餐时间在2pm--6pm之间并且当前时间在2pm--6pm之间
    if order_time > time1 && order_time < time2 && time > time1 && time < time2
      return true
    end
    return false
  end
end
