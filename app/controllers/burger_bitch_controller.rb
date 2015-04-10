class BurgerBitchController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout 'application'
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  
  def after_sign_in_path_for(resource)
    if !current_user.nil?
      root_path
    end
  end

end
