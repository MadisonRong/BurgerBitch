module OrdersHelper

  ***REMOVED*** 判断是否可以取消订单
  def can_del?(order_time)
    order_time = order_time.to_i
    time = Time.now
    now_time = time.to_s
    ***REMOVED*** lunch
    time1 = Time.parse(time.strftime("%Y-%m-%d 11:30:00")).to_i
    ***REMOVED*** dinner
    time2 = Time.parse(time.strftime("%Y-%m-%d 17:30:00")).to_i
    today = Time.parse(time.strftime("%Y-%m-%d 00:00:00")).to_i
    time = time.to_i
    ***REMOVED*** 订餐时间为2pm前并且当前时间未超过2pm
    if today < order_time && time < time1 && order_time < time1
      return true
    end
    ***REMOVED*** 订餐时间在2pm--6pm之间并且当前时间在2pm--6pm之间
    if today < order_time && order_time > time1 && order_time < time2 && time > time1 && time < time2
      return true
    end
    return false
  end
end
