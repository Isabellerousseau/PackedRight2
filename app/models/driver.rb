class Driver < ApplicationRecord
  has_many :reviews
  belongs_to :user
  has_many :orders
  has_many :deliveries, through: :orders
  has_many :parcels, through: :orders

  CATEGORY = %w[Bike Car Van].freeze

  validates :category, inclusion: { in: CATEGORY }

  geocoded_by :address

  before_save :geocode, if: :will_save_change_to_address?
end
