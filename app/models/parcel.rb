class Parcel < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :driver, optional: true
  has_one :delivery, through: :orders
  has_one :order

  CATEGORY = %w[Bike Car Van].freeze

  validates :name, :weight, :category, :fragile, presence: true
  validates :category, inclusion: { in: CATEGORY }
end

# instellen dat hij niet een driver MOET hebben meteen.
