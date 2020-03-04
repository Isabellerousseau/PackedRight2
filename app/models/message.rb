class Message < ApplicationRecord
  belongs_to :driver
  belongs_to :user
  validates :content, presence: true
end
