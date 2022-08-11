class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new edit update]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.hosted_events.build(allowed_post_params)
    if @event.save
      redirect_to event_path(@event), notice: 'Your post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(allowed_post_params)
      redirect_to event_path(@event), notice: 'Your post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def allowed_post_params
    params.require(:event).permit(:name, :location, :time, :description)
  end
end