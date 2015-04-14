class BurgerBitchOAuth 
  def self.get_token(code)
    params_hash = Hash.new
    params_hash[:grant_type] = "authorization_code"
    params_hash[:code] = code
    params_hash[:redirect_uri] = "http://172.16.10.26:3000/authentication"
    params_hash[:client_id] = "7a9cef187baa31ef8b8dcf329fd86160b07abbc85728ebe0eb4c4be726af114c"
    params_hash[:client_secret] = "4211b5c0b218d8edcc7d36b9bb8d1a479831c1f6d8b6757c9818e6077e314102"
    response = RestClient.post('http://glassx.cn/oauth/token',
      params_hash.to_json,
      :content_type => :json, 
      :accept => :json
      )
    return response
  end
end