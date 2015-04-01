class DishesController < BurgerBitchController
  def create
    @dishes = Restaurant.get_dishes(params[:restaurant])
  end
end
