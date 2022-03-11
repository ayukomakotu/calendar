class Order < ApplicationRecord
  belongs_to :event
  belongs_to :route
  belongs_to :item
  validates :route_id, presence: true
  validates :item_id, presence: true

end
