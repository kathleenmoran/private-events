class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.hosted_events.build(allowed_post_params)
    if @event.save
      redirect_to new_event_path, notice: 'Your post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
end

private

def allowed_post_params
  params.require(:event).permit(:name, :location, :time)
end
