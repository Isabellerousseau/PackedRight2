class Driver < ApplicationRecord
  has_many :reviews
  belongs_to :user
  has_many :orders
  has_many :deliveries, through: :orders
  has_many :parcels, through: :orders

  has_many :messages, as: :messageable

  # has_many :messages

  CATEGORY = %w[Bike Car Van].freeze
  enum category: CATEGORY

  # validates :category, inclusion: { in: CATEGORY }

  geocoded_by :address

  before_save :geocode, if: :will_save_change_to_address?

  def available?
    !self.orders.where(status: 'in_progress').any? && self.active
  end

  def self.available_drivers(category, pickup)
    where(category: category).near(pickup).find{|d| d.available? }
  end
end


# id self.order = nil ipv
