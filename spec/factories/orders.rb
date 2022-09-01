FactoryBot.define do
  factory :order do
    number { 100 }
    price  { 100000 }
    day    { "#{Date.today.end_of_month}" }
  end

  factory :order2, class: Order do
    number { 100 }
    price  { 200000 }
    day    { "#{Date.today.end_of_month.yesterday}" }
    created_at { Time.now.prev_day }
  end

  factory :order3, class: Order do
    number { 100 }
    price  { 400000 }
    day    { "#{Date.today}" }
    created_at { Time.now }
  end

end
