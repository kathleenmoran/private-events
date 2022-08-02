class EventAttendeesController < ApplicationController
  def index
    @event_attendees = EventAttendee.all
  end

  def show
    @event_attendee = EventAttendee.find(params[:id])
  end

  def new
    @event_attendee = EventAttendee.new(allowed_post_params)
  end

  def create
    @event_attendee = EventAttendee.new(allowed_post_params)
    if @event_attendee.save
      redirect_to request.referrer, notice: 'You have successfully joined this event.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event_attendee = EventAttendee.find(params[:id])
    @event_attendee.destroy

    redirect_to request.referrer, notice: 'You have successfully left this event.'
  end

  private

  def allowed_post_params
    params.require(:event_attendee).permit(:event_id, :attendee_id)
  end
end