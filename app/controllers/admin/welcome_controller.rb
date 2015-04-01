class Admin::WelcomeController < Admin::ApplicationController
  layout 'admin'
  skip_before_action :authenticate_admin!, only:[:index]
  def index
  end
end
