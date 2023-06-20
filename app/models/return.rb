class Return < ApplicationRecord
  belongs_to :warehouse_operator, foreign_key: :warehouse_operator_id, class_name: "User"

  # The user being followed
  belongs_to :client_service_officer, foreign_key: :client_service_officer_id, class_name: "User"
end
