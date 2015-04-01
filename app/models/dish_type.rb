class DishType < ActiveRecord::Base
  has_many :dishes

  # 获取所有菜式类型
  scope :get_types, ->{ DishType.select(:id, :name).all }

end
