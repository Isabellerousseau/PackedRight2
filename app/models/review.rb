class Review < ApplicationRecord
  belongs_to :user
  belongs_to :driver
  belongs_to :order
  has_one :delivery, through: :orders
end
# order has two review because from driver AND user?? soooo..... syntax
