class Order < ApplicationRecord
  belongs_to :driver, optional: true
  belongs_to :user
  has_one :delivery
  belongs_to :parcel
  accepts_nested_attributes_for :parcel
  # has_one :review
end
# order has two reviews.... moest het dan has_many? of....
# pickup location drop- off location
