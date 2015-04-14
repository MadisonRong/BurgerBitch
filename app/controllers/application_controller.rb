class ApplicationController < ActionController::Base
  ***REMOVED*** Prevent CSRF attacks by raising an exception.
  ***REMOVED*** For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  include SessionsHelper
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope.to_s == "user"
      root_path
    elsif resource_or_scope.to_s == "admin"
      admin_root_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
