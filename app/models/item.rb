class Item < ApplicationRecord
  belongs_to :order
  belongs_to :return, optional: true
end
