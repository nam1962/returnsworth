class ReturnItem < ApplicationRecord
  belongs_to :return
  belongs_to :order_item
end
