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

  #顧客
  Customer.create(last_name: "こだま", first_name: "太郎", address: "松江市", telephone: "XXXXX")

  #商品
  item = [
      { :name => "駆除", :unit => "㎡", :price => 2600 }, 
      { :name => "防除", :unit => "㎡", :price => 2600 },
      { :name => "換気扇", :unit => "台", :price => 70000 },
      { :name => "かわい太郎", :unit => "坪", :price => 15000 }
    ]
  item.each do |item|
    Item.create(name: item[:name], unit: item[:unit], price: item[:price])
  end

  #取扱経路
  route = [ "農協", "直接"]
  route.each do |route|
    Route.create(name: route)
  end