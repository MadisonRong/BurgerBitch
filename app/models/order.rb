class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :dish

  scope :make_an_order, ->(params){
    
  }
end
