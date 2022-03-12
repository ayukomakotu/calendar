class EventForm
    include ActiveModel::Model
    attr_accessor :start_time, :day, :start, :finish, :last_name, :first_name, 
                :address, :telephone, :route_id, :item_id, :number
        
    # validationをひとまとめにする
    # with_options presence: true do
    #     validates :day
    # end

    def save
        if @event_form.valid?
            customer = Customer.create(last_name: last_name, first_name: first_name, 
                                    address: address, telephone: telephone)
            event = Event.create(start_time: start_time, day: day, start: start, finish: finish,
                                user_id: user_id, customer_id: customer_id)
            Order.create(number: number, event: event.id, route_id: route_id, item_id: item_id)
        else
            render 'events/new'
        end
    end
end