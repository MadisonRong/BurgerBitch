module SessionsHelper

  def logined?
    redis = BurgerBitchRedisServer.redis
    email = cookies[:burgerbitch]
    unless redis.get("#{email}-refresh_token").nil?
      unless redis.get("#{email}-access_token").nil?
        return true
      else
        response = BurgerBitchOAuth.refresh_token(
          redis.get("#{email}")["access_token"],
          redis.get("#{email}-refresh_token")
        )
        BurgerBitchOAuth.set_token(email, response)
        return true
      end
    else
      return false
    end
  end

  def current_user?
    unless logined?
      store_location
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find_by_email(cookies[:burgerbitch])
  end

  def store_location
    session[:return_to] = request.fullpath if request.get?
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
  
  def create_cookies(user_info)
    cookies.permanent[:burgerbitch] = user_info["email"]
  end

  # 删除redis里相关的数据
  def destroy_data
    email = cookies[:burgerbitch]
    redis = BurgerBitchRedisServer.redis
    redis.del(email)
    redis.del("#{email}-access_token")
    redis.del("#{email}-refresh_token")
  end

  def destroy_cookies
    cookies.delete(:burgerbitch)
  end
end
