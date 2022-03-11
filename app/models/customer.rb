class Customer < ApplicationRecord
  has_many :events
  #Customer.ordersで顧客の受注履歴を取得するため
  has_many :orders,            through: :events

end
