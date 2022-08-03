class Event < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  has_many :orders
  validates :customer_id, presence: true
  validates :user_id, presence: true
end
