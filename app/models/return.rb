class Return < ApplicationRecord
  belongs_to :warehouse_operator, foreign_key: :warehouse_operator_id, class_name: "User"
  belongs_to :client_service_officer, foreign_key: :client_service_officer_id, class_name: "User"

  has_many :return_items
  accepts_nested_attributes_for :return_items
end
