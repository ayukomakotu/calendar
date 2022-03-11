FactoryBot.define do
  factory :order do
    number { 100 }
    association :event,   factory: :event
    association :route,   factory: :route
    association :item,    factory: :item
  end
end
