# メインのサンプルユーザーを1人作成する
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password: "password",
             password_confirmation: "password",
             confirmed_at: 2.hour.ago,
             confirmation_sent_at: 1.hour.ago)

# 追加のユーザーをまとめて生成する
99.times do |n|
    name  = Faker::Name.name + "#{n}"
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password,
                 confirmed_at: 1.hour.ago,
                 confirmation_sent_at: Time.zone.now)
  end