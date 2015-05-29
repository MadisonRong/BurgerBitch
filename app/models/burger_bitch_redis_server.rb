class BurgerBitchRedisServer < ActiveRecord::Base
  def self.redis
    require 'redis'
    return @redis ||= Redis.new
  end

  # 修改订餐时间
  def self.update_time(params)
    if params[:meal] == "1"
      # 修改午饭订餐时间
      return redis.set("lunch_start_time", " #{params[:start_time]}") && redis.set("lunch_end_time", " #{params[:end_time]}")
    elsif params[:meal] == "2"
      # 修改晚饭订餐时间
      return redis.set("dinner_start_time", " #{params[:start_time]}") && redis.set("dinner_end_time", " #{params[:end_time]}")
    end
  end
end
