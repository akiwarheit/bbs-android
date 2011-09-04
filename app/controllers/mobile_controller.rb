class MobileController < ApplicationController
  def index

  end
  
  def events
    @events = Event.all
    
    respond_to do |format| 
      format.json { render :json => @events }
    end
  end
  
  def organizations
    @organizations = Organization.all
    
    respond_to do |format| 
      format.json { render :json => @organizations }
    end
  end
  
  def admins
    @admins = User.where(:is_admin => true)
    
    respond_to do |format| 
      format.json { render :json => @admins }
    end   
  end
    
end
