class Order < ApplicationRecord
  belongs_to :driver, optional: true
  belongs_to :user
  has_one :delivery, dependent: :destroy
  belongs_to :parcel
  accepts_nested_attributes_for :parcel

  CATEGORY = %w[Bike Car Van].freeze
  AVAILABLE_STATUSES = %i[pending in_progress delivered].freeze

  enum category: CATEGORY
  enum status: AVAILABLE_STATUSES

  has_many :messages, dependent: :destroy, dependent: :destroy
  has_one :review, dependent: :destroy

  geocoded_by :pickup
  before_save :geocode, if: :will_save_change_to_pickup?
  geocoded_by :drop_off
  before_save :geocode, if: :will_save_change_to_drop_off?

  before_save :send_delivery_confirmation, if: :will_save_change_to_status?

  def select_driver
    self.driver = Driver.where(category: category).near(pickup).first
    self.status = 'in_progress'
    self.save
    self.notify_driver
  end

  def notify_driver
    ActionCable.server.broadcast("driver_#{self.driver.id}", message: {content: 'WORK'})
  end

  def send_delivery_confirmation
    DeliveryMailer.with(order_id: self.id).confirmation.deliver_now if (self.status == 'delivered')
  end
end
# order has two reviews.... moest het dan has_many? of....
# pickup location drop- off location
# o = Order.create category: "Car", weight: 10, fragile: true, driver_id: 9, user_id: User.last.id, parcel_id: 15, pickup: "Amsterdam", drop_off: "Den Haag"
