class Message < ApplicationRecord
  belongs_to :driver, optional: true
  belongs_to :user
  belongs_to :order
  validates :content, presence: true

  after_create :broadcast_message

  private

  def broadcast_message
    ActionCable.server.broadcast("chat_#{self.order.id}", message: self)
  end
end
