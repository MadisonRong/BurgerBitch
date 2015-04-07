class Admin::OrdersController < Admin::ApplicationController
  # skip_before_action :authenticate_admin!, only:[:index]
  layout 'admin'
  def index
    order_hash = Order.check_it_out
    @orders = order_hash[:orders]
    @sum = order_hash[:total]
  end

  def all
    # @orders = Order.get_all
  end

  def all_json
    @orders_hash = Order.get_all(params)
    render json: @orders_hash
  end
end
