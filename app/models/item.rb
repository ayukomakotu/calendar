class Item < ApplicationRecord
  has_many :orders
  validates :name, uniqueness: true
end
