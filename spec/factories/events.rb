FactoryBot.define do
  factory :event do
    datetime { "2022-02-04 23:32:52" }
    association :user,     factory: :michael
    association :customer, factory: :customer
  end
end
