class Order < ApplicationRecord
  has_many :returns
  has_many :items
end
