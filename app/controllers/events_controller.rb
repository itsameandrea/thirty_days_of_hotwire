class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    
    respond_to do |format|
      if @event.save
        format.turbo_stream
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :starting_at)
  end
end

