class StaticController < ApplicationController
  def index
    @today = Date.today
    @user = current_user
    # @events = Event.all(:order => "when DESC")
    # @events = Event.this_week
    @events = Event.where(
      :when => Date.today.beginning_of_week..Date.today.end_of_week).order(
      "updated_at DESC")
    
    # @announcements = Announcement.where(
      # :created_at => Date.today.beginning_of_week..Date.today.end_of_week)
    
    @announcements = Announcement.all
  end
end
