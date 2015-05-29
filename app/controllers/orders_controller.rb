class OrdersController < BurgerBitchController
  before_action :check_name, only:[:new, :create]
  before_action :check_order, only:[:new, :create]

  def index
    @orders = Order.get_orders(User.get_id_by_email(cookies[:burgerbitch]))
    @sum = Order.sum_this_month(User.get_id_by_email(cookies[:burgerbitch]))
  end

  def new
    @order = Order.new
    @restaurant = Restaurant.get_restaurant
  end

  def create
    order = Order.make_an_order(params[:dish_id], User.get_id_by_email(cookies[:burgerbitch]))
    redirect_to user_order_path(order)
  end

  def show
    @order = Order.find(params[:id])
    if @order.user.id != current_user.id
      render text: "you have no right to visit this page."
    end
  end

  def destroy
    Order.find(params[:id]).destroy
    redirect_to action: :index
  end
  
  private
   def check_order
    @order_count = Order.has_order?(User.get_id_by_email(cookies[:burgerbitch]))
    if @order_count < 0
      render 'tips'
      return
    end
   end

   def check_name
    @user = User.find_by_email(cookies[:burgerbitch])
    real_name = @user.real_name
    if real_name.blank?
      store_location
      redirect_to edit_user_path
      return
    end
   end
end
