class WelcomeController < BurgerBitchController
  skip_before_action :current_user?, only:[:index]
  def index
  end
end
