FactoryBot.define do
  factory :appoint1, class: Appoint do
    name { "prospect" }
    address { "sample_address" }
    telephone { "xxx-xxxx-xxxx" }
    day { "2022-03-19" }
    time { "2022-03-19 09:00:00" }
    kind { "promotion" }
    result { nil }
  end
end
