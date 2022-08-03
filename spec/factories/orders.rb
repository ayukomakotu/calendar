FactoryBot.define do
  factory :order do
    number { 100 }
    price  { 100000 }
    day    { "2022-7-7" }
  end
end
