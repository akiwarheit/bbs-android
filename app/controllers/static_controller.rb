class StaticController < ApplicationController
  def index
    @today = Date.today
    @user = current_user
    @events = Event.all
  end
end
