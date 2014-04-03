class EventsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @event = Event.new(current_user.neighborhoods, current_user.categories)
  end

  def preferences
    @user = current_user
    @neighborhoods = Neighborhood.all
    @categories = Category.all
  end

end