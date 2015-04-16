class OrdersController < BurgerBitchController

  ***REMOVED*** before_action :check_order, only:[:new]

  def index
    @orders = Order.get_orders(User.get_id(cookies[:burgerbitch]))
    @sum = Order.sum_this_month(User.get_id(cookies[:burgerbitch]))
  end

  def new
    @order = Order.new
    @restaurant = Restaurant.get_restaurant
  end

  def create
    @result = Order.make_an_order(params[:dish_id], User.get_id(cookies[:burgerbitch]))
    @dish = Dish.find(params[:dish_id])
  end

  def destroy
    Order.find(params[:id]).destroy
    redirect_to action: :index
  end
  
  private
   def check_order
    @order_count = Order.has_order?(User.get_id(cookies[:burgerbitch]))
    if @order_count != 0
      render 'tips'
      return
    end
   end
end
