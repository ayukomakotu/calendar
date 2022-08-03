class Item < ApplicationRecord
  has_one :orders
  validates :name, uniqueness: true, presence: true
  validates :unit, presence: true
  validates :price, presence: true
end
