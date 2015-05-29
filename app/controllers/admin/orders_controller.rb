class Admin::OrdersController < Admin::ApplicationController
  ***REMOVED*** skip_before_action :authenticate_admin!, only:[:index]
  layout 'admin'
  def index
  end

  def ajax
    order_hash = Order.check_it_out(params[:date], params[:meal])
    @orders = order_hash[:orders]
    @sum = order_hash[:total]
    respond_to do |format|
      format.html { render nothing: true }
      format.js
    end
  end

  def all
    ***REMOVED*** @orders = Order.get_all
  end

  def all_json
    @orders_hash = Order.get_all(params)
    render json: @orders_hash
  end

  ***REMOVED*** 展示订餐时间
  def time
    redis = BurgerBitchRedisServer.redis
    @lunch_start_time = redis.get("lunch_start_time").strip
    @lunch_end_time = redis.get("lunch_end_time").strip
    @dinner_start_time = redis.get("dinner_start_time").strip
    @dinner_end_time = redis.get("dinner_end_time").strip
  end

  ***REMOVED*** 修改订餐时间
  def edit_time
    @result = BurgerBitchRedisServer.update_time(params)
    respond_to do |format|
      format.html { render nothing: true }
      format.js
    end
  end
end
