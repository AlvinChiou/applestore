class Township < ActiveRecord::Base
  belongs_to :county
  belongs_to :order_info
  has_many :orders
  has_many :users
  has_many :order_info
end
