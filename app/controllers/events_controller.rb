class EventsController < ApplicationController



  def index
    @events = Event.all
    @rsvps = Rsvp.all
    @user = User.find(session[:id])
  end


  def join
    rsvp = Rsvp.new(attendees_id:session[:id], event_id:params[:id])
    if rsvp
      rsvp.save
    else
      flash[:rsvp_error] = rsvp.errors.full_messages
    end
    redirect_to "/events/index"
  end

  def show
    @event = Event.find(params[:id])
    @count = @event.attendees.count
    @comments = @event.comments
    @attendees = @event.attendees
  end

  def edit
    @event = Event.find(params[:id])
    render '/events/edit'
  end

  def update
    Event.find(params[:id]).update(name:params[:name], date:params[:date], city:params[:city], state:params[:state])
    redirect_to '/events/index/'
  end

  def delete
    Event.find(params[:id]).destroy
    redirect_to '/events/index'
  end

  def create
    event = Event.create(name:params[:name], date:params[:date], city:params[:city], state:params[:state], host_id: session[:id])
    if event.valid?
      event.save
    else
      flash[:message]= event.errors.full_messages
    end
      redirect_to "/events/index"
  end
end
