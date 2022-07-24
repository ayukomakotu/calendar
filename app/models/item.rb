class Item < ApplicationRecord
  # has_one :orders
  validates :name, uniqueness: true
end
