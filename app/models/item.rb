class Item < ApplicationRecord
  belongs_to :order, optional: true
  has_one_attached :photo
end
