class BurgerBitchOAuth < ActiveRecord::Base
  def self.get_token(code)
    params_hash = Hash.new
    params_hash[:grant_type] = "authorization_code"
    params_hash[:code] = code
    params_hash[:redirect_uri] = OAUTH2['redirect_uri']
    params_hash[:client_id] = OAUTH2['client_id']
    params_hash[:client_secret] = OAUTH2['client_secret']
    response = RestClient.post(OAUTH2['glassx_oauth'],
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
    response = RestClient.post(OAUTH2['glassx_oauth'],
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
