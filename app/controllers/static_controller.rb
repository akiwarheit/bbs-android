class StaticController < ApplicationController
  def index
    @events = Event.all
    @highlight_events = Event.where(:id => 1)
  end
end
