class WishItem < ActiveRecord::Base
  belongs_to :wish_list
  belongs_to :product
end
