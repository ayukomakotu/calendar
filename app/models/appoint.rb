class Appoint < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    validates :address, presence: true
    validates :telephone, presence: true
    validates :day, presence: true
    validates :time, presence: true
    validates :kind, presence: true
    validates :user_id, presence: true
end
