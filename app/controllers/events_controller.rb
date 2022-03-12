class EventsController < ApplicationController
  def index
  end

  def new
    @event_form = EventForm.new
  end

  def create
    @event_form.new(event_form_params)
    @event_form.save
  end

  private
    def event_form_params
      params.require(:event_form).permit(:start_time, :day, :start, :finish, :last_name, :first_name, 
                        :address, :telephone, :route_id, :item_id, :number)
    end
end
