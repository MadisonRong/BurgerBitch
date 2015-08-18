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
    ){ |response, request, result, &block|
        if [301, 302, 307].include? response.code
          response.follow_redirection(request, result, &block)
        else
          response.return!(request, result, &block)
        end
      }
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
    # 设置整个oauth_message
    redis.set("#{email}", response["access_token"])
    # 设置access_token
    redis.set("#{email}-access_token", response["access_token"])
    # 设置access_token过期时间
    redis.expire("#{email}-access_token", Time.now.to_i+response["expires_in"])
    # 设置refresh_token
    redis.set("#{email}-refresh_token", response["refresh_token"])
  end
end
