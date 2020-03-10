class Review < ApplicationRecord
  belongs_to :user
  belongs_to :driver
  belongs_to :order
  has_one :delivery, through: :orders

 def blank_stars
   5 - rating.to_i
  end

end
# order has two review because from driver AND user?? soooo..... syntax
