class EventsController < ApplicationController
  before_action :logged_in_user
  def index
    @event_form = EventForm.new
    @events = Event.all
  end

  def new
    @event_form = EventForm.new
  end

  def create
    @event_form = EventForm.new(event_form_params)
    if @event_form.valid?
      @event_form.save
      flash[:success] = "施工予定を追加しました"
      redirect_to events_path
    else
      render 'new'
    end
  end

  def achievements
    @users = User.all
  end

  private
    def event_form_params
      params.require(:event_form).permit(:start_time, :day, :start, :finish, :car, :last_name, :first_name, 
                        :address, :telephone, :user_id, :route_id, :item_id, :number, :price)
    end
end
