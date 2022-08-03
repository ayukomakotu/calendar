FactoryBot.define do
  factory :event do
    start_time { DateTime.now }
    car        { 1 }
    start      { Time.local(2022,4,25,9,0,0) }
    finish     { Time.local(2022,4,25,11,0,0) }
  end
end
