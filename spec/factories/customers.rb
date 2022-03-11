FactoryBot.define do
  factory :customer do
    last_name { "田中" }
    first_name { "太郎" }
    address { "松江市西嫁島町" }
    telephone { "0852-67-6757" }
  end
end
