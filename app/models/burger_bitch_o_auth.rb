class BurgerBitchOAuth < ActiveRecord::Base
  def self.get_token(code)
    params_hash = Hash.new
    params_hash[:grant_type] = "authorization_code"
    params_hash[:code] = code
    params_hash[:redirect_uri] = "http://172.16.10.163/authentication"
    params_hash[:client_id] = "7a9cef187baa31ef8b8dcf329fd86160b07abbc85728ebe0eb4c4be726af114c"
    params_hash[:client_secret] = "4211b5c0b218d8edcc7d36b9bb8d1a479831c1f6d8b6757c9818e6077e314102"
    response = RestClient.post('http://glassx.cn/oauth/token',
      params_hash.to_json,
      :content_type => :json, 
      :accept => :json
    )
    return JSON.parse response
  end

  def self.refresh_token(access_token, refresh_token)
    params_hash = Hash.new
    params_hash[:grant_type] = "refresh_token"
    params_hash[:refresh_token] = refresh_token
    params_hash[:access_token] = access_token
    response = RestClient.post('http://glassx.cn/oauth/token',
      params_hash.to_json,
      :content_type => :json, 
      :accept => :json
    )
    return JSON.parse response
  end

  def self.set_token(email, response)
    redis = BurgerBitchRedisServer.redis
    ***REMOVED*** 设置整个oauth_message
    redis.set("***REMOVED***{email}", response["access_token"])
    ***REMOVED*** 设置access_token
    redis.set("***REMOVED***{email}-access_token", response["access_token"])
    ***REMOVED*** 设置access_token过期时间
    redis.expire("***REMOVED***{email}-access_token", Time.now.to_i+response["expires_in"])
    ***REMOVED*** 设置refresh_token
    redis.set("***REMOVED***{email}-refresh_token", response["refresh_token"])
  end
end
