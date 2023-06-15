class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Enum for role
  enum role: { warehouse_operator: 0, client_service_officer: 1 }

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :returns
end
