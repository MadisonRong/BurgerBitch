class ApplicationController < ActionController::Base
  ***REMOVED*** Prevent CSRF attacks by raising an exception.
  ***REMOVED*** For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
