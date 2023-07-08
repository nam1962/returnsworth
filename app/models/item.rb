class Item < ApplicationRecord
  belongs_to :order
  belongs_to :return, optional: true
  has_one_attached :photo
end
