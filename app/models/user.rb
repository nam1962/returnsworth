class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Enum for role
  # enum role: { warehouse_operator: 0, client_service_officer: 1 }
  validates :role, inclusion: { in: %w[warehouse_operator client_service_officer] }

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :returns

  def warehouse_operator?
    role == 'warehouse_operator'
  end

  def client_service_officer?
    role == 'client_service_officer'
  end
end

