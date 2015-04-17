class Admin < ActiveRecord::Base
  ***REMOVED*** Include default devise modules. Others available are:
  ***REMOVED*** :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
end
