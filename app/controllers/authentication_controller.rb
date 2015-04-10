class AuthenticationController < ApplicationController
  @appid = "7a9cef187baa31ef8b8dcf329fd86160b07abbc85728ebe0eb4c4be726af114c"
  @secret = "4211b5c0b218d8edcc7d36b9bb8d1a479831c1f6d8b6757c9818e6077e314102"
  @callback_url = "http://172.16.10.26:3000/authentication"
  ***REMOVED*** api.glassx.cn/v1/users   GET

  def index
    params_hash = Hash.new
    params_hash[:grant_type] = "authorization_code"
    params_hash[:code] = params[:code]
    params_hash[:redirect_uri] = "http://172.16.10.26:3000/authentication"
    params_hash[:client_id] = "7a9cef187baa31ef8b8dcf329fd86160b07abbc85728ebe0eb4c4be726af114c"
    params_hash[:client_secret] = "4211b5c0b218d8edcc7d36b9bb8d1a479831c1f6d8b6757c9818e6077e314102"
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
    ***REMOVED*** rest_client
    @response = RestClient.post('http://glassx.cn/oauth/token',
      params_hash.to_json,
      :content_type => :json, 
      :accept => :json
      )
    cookies[:burgerbitch] = {
      value: ActiveSupport::JSON.decode(@response)["access_token"],
      expires: 1.week.from_now,
      domain: '172.16.10.26'
    }
    ***REMOVED*** binding.pry
    render 'welcome/index'
  end

end
