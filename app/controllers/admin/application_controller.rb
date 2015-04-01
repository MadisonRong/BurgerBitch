class Admin::ApplicationController < ApplicationController
  ***REMOVED*** Prevent CSRF attacks by raising an exception.
  ***REMOVED*** For APIs, you may want to use :null_session instead.
  layout 'admin'
  protect_from_forgery with: :exception
  before_action :authenticate_admin! 
  def after_sign_in_path_for(resource)
    if !current_admin.nil?
      admin_root_path
    end
  end

end
