class Order < ApplicationRecord
  belongs_to :driver, optional: true
  belongs_to :user
  has_one :delivery
  belongs_to :parcel
  accepts_nested_attributes_for :parcel

  CATEGORY = %w[Bike Car Van].freeze
  enum category: CATEGORY

  has_many :messages
  # has_one :review

  geocoded_by :pickup

  before_save :geocode, if: :will_save_change_to_pickup?

  geocoded_by :drop_off

  before_save :geocode, if: :will_save_change_to_drop_off?

end
# order has two reviews.... moest het dan has_many? of....
# pickup location drop- off location
