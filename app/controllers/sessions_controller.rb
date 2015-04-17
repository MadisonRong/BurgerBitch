class SessionsController < ApplicationController
  def destroy
    destroy_data
    destroy_cookies
    redirect_to root_path
  end
end
