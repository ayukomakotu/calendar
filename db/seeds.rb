# 営業所のサンプル
Office.create!(name: "松江")
Office.create!(name: "出雲")


# メインのサンプルユーザーを1人作成する
User.create!(name:  "こだま太郎",
             number: 100,
             password: "password",
             password_confirmation: "password",
             office_id: 1)

# 追加のユーザーをまとめて生成する
15.times do |n|
    name  = Faker::Name.name + "#{n}"
    number = n
    password = "password"
    User.create!(name:  name,
                 number: number,
                 password:              password,
                 password_confirmation: password,
                 office_id: 1)
end

15.times do |n|
    name  = Faker::Name.name + "#{n}"
    number = n + 15
    password = "password"
    User.create!(name:  name,
                 number: number,
                 password:              password,
                 password_confirmation: password,
                 office_id: 2)
end

  #目標
  Target.create(year: 2022, all: 372000000, tr_3:31000000, tr_4: 31000000, tr_5: 31000000,
                tr_6: 31000000, tr_7: 31000000, tr_8: 31000000, tr_9: 31000000, tr_10: 31000000,
                tr_11: 31000000, tr_12: 31000000, tr_1: 31000000, tr_2: 31000000, office_id: 1)

  Target.create(year: 2022, all: 12000000, tr_3: 000000, tr_4: 1000000, tr_5: 1000000,
                tr_6: 1000000, tr_7: 1000000, tr_8: 1000000, tr_9: 1000000, tr_10: 1000000,
                tr_11: 1000000, tr_12: 1000000, tr_1: 1000000, tr_2: 1000000, user_id: 1)

  (2..31).each do |n|
      Target.create(year: 2022, all: 12000000, tr_3: 000000, tr_4: 1000000, tr_5: 1000000,
                tr_6: 1000000, tr_7: 1000000, tr_8: 1000000, tr_9: 1000000, tr_10: 1000000,
                tr_11: 1000000, tr_12: 1000000, tr_1: 1000000, tr_2: 1000000, user_id: n)
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

  #施工予定
  Event.create(start_time: DateTime.now, car: 1, start: Time.local(2022,4,25,9,0,0),
                    finish: Time.local(2022,4,25,11,0,0), user_id: 1, customer_id: 1)

  #商品
  Order.create(number: 100, price: 260000, day: Date.today, user_id: 1, event_id: 1,
                route_id: 1, item_id: 1)

  #見込み
  appoint = [
      { :name => "鈴木", :address => "松江", :telephone => "xxx-xxxx", :day => Date.today,
            :time => Time.new(2022,3,20,9,0,0), :kind => "推進", :result => "否決", :user_id => 1}, 
      { :name => "佐藤", :address => "松江", :telephone => "xxx-xxxx", :day => Date.today,
            :time => Time.new(2022,3,20,11,0,0), :kind => "申込", :result => "受注", :user_id => 1}, 
      { :name => "田中", :address => "松江", :telephone => "xxx-xxxx", :day => Date.today,
            :time => Time.new(2022,3,20,13,0,0), :kind => "点検", :result => nil, :user_id => 1}, 
      { :name => "山本", :address => "松江", :telephone => "xxx-xxxx", :day => Date.today,
            :time => Time.new(2022,3,20,15,0,0), :kind => "DM", :result => nil, :user_id => 1},
      { :name => "田中", :address => "松江", :telephone => "xxx-xxxx", :day => Date.today,
            :time => Time.new(2022,3,20,13,0,0), :kind => "点検", :result => nil, :user_id => 2}, 
      { :name => "山本", :address => "松江", :telephone => "xxx-xxxx", :day => Date.today,
            :time => Time.new(2022,3,20,15,0,0), :kind => "DM", :result => nil, :user_id => 2}
  ]

  appoint.each do |appoint|
    Appoint.create(name: appoint[:name], address: appoint[:address], 
        telephone: appoint[:telephone], day: appoint[:day], time: appoint[:time],
        kind: appoint[:kind], result: appoint[:result], user_id: appoint[:user_id])
  end