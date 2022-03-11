FactoryBot.define do

  factory :michael, class: User do
    name                     {"Michael Example"}
    email                    {"michael@example.com"}
    password                 {"password"}
    password_confirmation    {"password"}
    confirmed_at             {2.hour.ago}
    confirmation_sent_at     {1.hour.ago}
  end

  factory :archer, class: User do
    name                     {"Archer Example"}
    email                    {"archer@example.com"}
    password                 {"password"}
    password_confirmation    {"password"}    
    confirmed_at             {2.hour.ago}
    confirmation_sent_at     {1.hour.ago}
  end
  
  factory :sample, class: User do
    sequence(:name)         { |n| "user#{n}"}
    sequence(:email)        { |n| "user#{n}@example.com"}
    password                {"password"}
    password_confirmation   {"password"}
    confirmed_at             {2.hour.ago}
    confirmation_sent_at     {1.hour.ago}
  end
end
