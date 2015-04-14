class AuthenticationController < ApplicationController
  def index
    
    # Faraday
    # conn = Faraday.new(:url => 'http://glassx.cn') do |faraday|
    #   faraday.request  :url_encoded             # form-encode POST params
    #   faraday.response :logger                  # log requests to STDOUT
    #   faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    # end
    # @response = conn.post do |req|
    #   req.url "http://glassx.cn/oauth/token",
    #   req.body = params_hash
    # end
    # response2 = conn.get "http://api.glassx.cn/v1/users.json", { "access_token" => cookies[:burgerbitch] }
    # rest_client
    response = BurgerBitchOAuth.get_token(params[:code])
    user_info = User.get_user_info(response["access_token"])
    create_cookies(user_info)
    User.add_or_update_user(response, user_info)
    redirect_back_or root_path
  end

end
