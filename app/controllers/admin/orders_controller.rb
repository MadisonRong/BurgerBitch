class Admin::OrdersController < Admin::ApplicationController
  # skip_before_action :authenticate_admin!, only:[:index]
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
    # @orders = Order.get_all
  end

  def all_json
    @orders_hash = Order.get_all(params)
    render json: @orders_hash
  end
end
