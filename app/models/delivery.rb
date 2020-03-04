class Delivery < ApplicationRecord
  belongs_to :order
  # belongs_to :review, through: :order // kan dit uberhaubt?
end
