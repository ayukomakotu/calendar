FactoryBot.define do
  factory :item do
    name { "test_item" }
    unit { "単価" }
    price { 10 }
  end
end
