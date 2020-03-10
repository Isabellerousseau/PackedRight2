class Driver < ApplicationRecord
  has_many :reviews
  belongs_to :user
  has_many :orders
  has_many :deliveries, through: :orders
  has_many :parcels, through: :orders

  after_create :broadcast_through_action_cable

  CATEGORY = %w[Bike Car Van].freeze
  enum category: CATEGORY

  # validates :category, inclusion: { in: CATEGORY }

  geocoded_by :address

  before_save :geocode, if: :will_save_change_to_address?

  def available?
    if self.orders == [] && self.active == true
      true
    else
      false
    end
  end

   private

  def broadcast_through_action_cable
    ActionCable.server.broadcast("driver_#{self.driver.id}", location: self)
  end

end
