class User < ActiveRecord::Base
  ***REMOVED*** Include default devise modules. Others available are:
  ***REMOVED*** :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
end
