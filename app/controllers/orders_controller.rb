class OrdersController < BurgerBitchController

  before_action :check_order, only:[:new]

  def index
    @orders = Order.get_orders(current_user.id)
    @sum = Order.sum_this_month(current_user.id)
  end

  def new
    @order = Order.new
    @restaurant = Restaurant.get_restaurant
  end

  def create
    @result = Order.make_an_order(params[:dish_id], current_user.id)
  end
  
  private
   def check_order
    @order_count = Order.has_order?(current_user.id)
    if @order_count != 0
      render 'tips'
      return
    end
   end
end
