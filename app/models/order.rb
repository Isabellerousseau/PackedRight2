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

  # before_save :set_dummy_coords, if: :will_save_change_to_pickup?
  # before_save :set_dummy_coords, if: :will_save_change_to_drop_off?

  before_save :send_delivery_confirmation, if: :will_save_change_to_status?
  after_create :select_driver

  def select_driver
    if self.driver_id.nil?
      self.driver_id = Driver.available_drivers(category, pickup).id
      self.status = 'in_progress'
      self.save
      self.notify_driver
    else
      self.notify_user
    end
  end

  def notify_driver
    ActionCable.server.broadcast("driver_#{self.driver.id}", message: {name: self.parcel.name, pickup: self.pickup, drop_off: self.drop_off, fragile: self.parcel.fragile ? 'yes' : 'no'})
  end

  def notify_user
    ActionCable.server.broadcast("chat_#{self.id}", error: {content: "I'm sorry we haven't found a driver for you yet."})
  end

  def send_delivery_confirmation
    DeliveryMailer.with(order_id: self.id).confirmation.deliver_now if (self.status == 'delivered')
  end

  def set_dummy_coords
    self.latitude = 51.55847
    self.longitude = 5.083076
  end
end
# order has two reviews.... moest het dan has_many? of....
# pickup location drop- off location
# o = Order.create category: "Car", weight: 10, fragile: true, driver_id: 9, user_id: User.last.id, parcel_id: 15, pickup: "Amsterdam", drop_off: "Den Haag"
