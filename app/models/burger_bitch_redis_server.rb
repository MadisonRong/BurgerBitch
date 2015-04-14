class BurgerBitchRedisServer < ActiveRecord::Base
  def self.redis
    require 'redis'
    return Redis.new
  end
end
