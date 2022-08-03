# メインのサンプルユーザーを1人作成する
User.create!(name:  "こだま",
             number: 100,
             password: "password",
             password_confirmation: "password")

# 追加のユーザーをまとめて生成する
30.times do |n|
    name  = Faker::Name.name + "#{n}"
    number = n
    password = "password"
    User.create!(name:  name,
                 number: number,
                 password:              password,
                 password_confirmation: password)
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