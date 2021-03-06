class EventsController < ApplicationController
  respond_to :json, :html
  
  before_filter :authenticate_user! #, :only => [:new, :create, :edit, :update]
  # GET /events
  # GET /events.xml
  def index
    if current_user.is_admin?
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.json { render :json => @events }
    end
    else
      redirect_to root_path
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
    @organization = Organization.find(@event.organization_id);

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
      format.json { render :json => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    if current_user.is_admin?
      @event = current_user.events.build
  
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @event }
      end
    else
      redirect_to root_path
    end
  end

  # GET /events/1/edit
  def edit
    if current_user.is_admin?
      @event = Event.find(params[:id])
    else
      redirect_to root_path
    end
  end

  # POST /events
  # POST /events.xml
  def create
    if current_user.is_admin?
      # params[:event][:user_id] = current_user.id
      # @event = Event.new(params[:event])
      @event = current_user.events.build(params[:event])
  
      respond_to do |format|
        if @event.save
          format.html { redirect_to(@event, 
            :notice => 'Event was successfully created.') }
          format.xml  { render :xml => @event, 
            :status => :created, 
            :location => @event }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @event.errors, 
            :status => :unprocessable_entity }
        end
      end
    else
      redirect_to root_path
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    if current_user.is_admin?
      @event = Event.find(params[:id])
  
      respond_to do |format|
        if @event.update_attributes(params[:event])
          format.html { redirect_to(@event, 
            :notice => 'Event was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @event.errors, 
            :status => :unprocessable_entity }
        end
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    if current_user.is_admin?
      @event = Event.find(params[:id])
      @event.destroy
  
      respond_to do |format|
        format.html { redirect_to(events_url) }
        format.xml  { head :ok }
      end
    end
  else
    redirect_to root_path
  end
  
end
