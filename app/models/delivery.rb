class Delivery < ApplicationRecord
  belongs_to :order
  after_create :send_delivery_confirmation

  def send_delivery_confirmation
    DeliveryMailer.with(delivery_id: self.id).confirmation.deliver_now
  end
end
