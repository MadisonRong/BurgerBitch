class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  has_many :orders

  def self.get_user_info(access_token)
    response = RestClient.get("http://api.glassx.cn/v1/users.json?access_token=#{access_token}")
    user_info = ActiveSupport::JSON.decode(response.body)
    return user_info
  end

  def self.add_or_update_user(oauth_message, user_info)
    access_token = oauth_message["access_token"]
    refresh_token = oauth_message["refresh_token"]
    expire_seconds = oauth_message["expires_in"]
    user = User.find_by(email: user_info["email"])
    if user.nil?
      # 新用户，保存信息
      User.create!(
        nickname: user_info["nickname"],
        email: user_info["email"],
        avatar_url: user_info["avatar_url"]
      )
    else 
      user.update_attribute(:nickname, user_info["nickname"])
    end
    email = user_info["email"]
    BurgerBitchOAuth.set_token(email, oauth_message)
  end

  def self.get_id_by_email(email)
    user = User.find_by_email(email)
    return user.id
  end

  def self.get_name_by_email(email)
    user = User.find_by_email(email)
    return user.real_name
  end
end
