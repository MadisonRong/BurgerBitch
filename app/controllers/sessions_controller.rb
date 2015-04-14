class SessionsController < ApplicationController
  def destroy
    destory_cookies
    redirect_to root_path
  end
end
