class AuthenticationController < ApplicationController
  def index
    
    ***REMOVED*** Faraday
    ***REMOVED*** conn = Faraday.new(:url => 'http://glassx.cn') do |faraday|
    ***REMOVED***   faraday.request  :url_encoded             ***REMOVED*** form-encode POST params
    ***REMOVED***   faraday.response :logger                  ***REMOVED*** log requests to STDOUT
    ***REMOVED***   faraday.adapter  Faraday.default_adapter  ***REMOVED*** make requests with Net::HTTP
    ***REMOVED*** end
    ***REMOVED*** @response = conn.post do |req|
    ***REMOVED***   req.url "http://glassx.cn/oauth/token",
    ***REMOVED***   req.body = params_hash
    ***REMOVED*** end
    ***REMOVED*** response2 = conn.get "http://api.glassx.cn/v1/users.json", { "access_token" => cookies[:burgerbitch] }
    ***REMOVED*** rest_client
    response = BurgerBitchOAuth.get_token(params[:code])
    p "get token is ok..."
    user_info = User.get_user_info(response["access_token"])
    p "get user info is ok..."
    create_cookies(user_info)
    p "create cookies is ok..."
    User.add_or_update_user(response, user_info)
    p "add or update user is ok...."
    redirect_back_or root_path
  end

end
