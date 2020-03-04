class Message < ApplicationRecord
  belongs_to :driver, optional: true
  belongs_to :user
  belongs_to :order
  validates :content, presence: true
end
