class EventForm
    include ActiveModel::Model
    # EventFormでメソッドとして使えるようにする
    attr_accessor :start_time, :day, :car, :start, :finish, :last_name, :first_name, 
                :address, :telephone, :user_id, :route_id, :item_id, :number, :day, :price
        
    # validationをひとまとめにする
    with_options presence: true do
        validates :start
        validates :finish
        validates :last_name
        validates :car
        validates :first_name
        validates :address
        validates :telephone
        validates :user_id
        validates :route_id
        validates :item_id
        validates :number
        validates :price
    end

    def save
        customer = Customer.create(last_name: last_name, first_name: first_name, 
                                address: address, telephone: telephone)
        event = Event.create(start_time: start_time, start: start, finish: finish, car: car,
                            user_id: user_id, customer_id: customer.id)
        Order.create(number: number, price: price, user_id: user_id, day: start_time,
                        event_id: event.id, route_id: route_id, item_id: item_id)
    end
end