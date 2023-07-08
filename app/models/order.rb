class Order < ApplicationRecord
  has_many :items
  accepts_nested_attributes_for :items # todo coucou ???

end
