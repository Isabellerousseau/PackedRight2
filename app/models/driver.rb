class Driver < ApplicationRecord
  has_many :reviews
  belongs_to :user
  has_many :orders
  has_many :deliveries, through: :orders
  has_many :parcels, through: :orders
  validates :name, :email, :phone_number, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
