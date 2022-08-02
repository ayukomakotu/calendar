class Order < ApplicationRecord
  belongs_to :event
  belongs_to :route
  belongs_to :item
  belongs_to :user
  validates :route_id, presence: true
  validates :item_id, presence: true

end
