class OrderItem < ApplicationRecord
  belongs_to :order
  has_one :return_item
end