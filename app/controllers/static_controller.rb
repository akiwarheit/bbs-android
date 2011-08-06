class StaticController < ApplicationController
  def index
    @events = Event.all
  end
end
