FactoryBot.define do
  factory :user1, class: User do
    name  { "user1" }
    number { 1000 }
    password { "password" }
    password_confirmation { "password" }
  
  end
  factory :user2, class: User do
    name  { "user2" }
    number { 2000 }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :user3, class: User do
    name  { "user3" }
    number { 3000 }
    password { "password" }
    password_confirmation { "password" }
  end

  factory :sample_user, class: User do
    sequence(:name, "sample_1")
    sequence(:number, 100)
    password { "password" }
    password_confirmation { "password" }
  end
end
