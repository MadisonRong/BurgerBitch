class BurgerBitchRedisServer < ActiveRecord::Base
  def self.redis
    require 'redis'
    return @redis ||= Redis.new
  end
end
