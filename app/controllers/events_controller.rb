class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @tasks = @event.tasks
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event with #{@event.name} is Created Successfully!"
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to event_path(@event)
    else
      render 'edit'
    end
  end

  def index
    @events = Event.paginate(page: params[:page], per_page:10)
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to events_path
  end
 
  private

  def event_params
    params.require(:event).permit(:name)
  end
end
