class County < ActiveRecord::Base
  has_many :orders
  has_many :township
  has_many :users
  has_many :order_info
  belongs_to :order_info
end
