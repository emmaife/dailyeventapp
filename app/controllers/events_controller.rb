class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @event = Event.new
  end

  def preferences
    @user = current_user
    @neighborhoods = Neighborhood.all
  end


end