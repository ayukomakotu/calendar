class Customer < ApplicationRecord
  has_many :events
  # Customer.ordersで顧客の受注履歴を取得するため
  has_many :orders,            through: :events
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :address, presence: true
  validates :telephone, presence: true
end
