class AnnouncementsController < ApplicationController
  before_filter :authenticate_user!
  # GET /announcements
  # GET /announcements.xml
  def index
    if current_user.is_admin?
      @announcements = Announcement.all
  
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @announcements }
      end
    else
      redirect_to root_path
    end
  end

  # GET /announcements/1
  # GET /announcements/1.xml
  def show
    @announcement = Announcement.find(params[:id])
    @organization = Organization.find(@announcement.organization_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @announcement }
    end
  end

  # GET /announcements/new
  # GET /announcements/new.xml
  def new
    if current_user.is_admin?
      @announcement = current_user.announcements.build
  
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @announcement }
      end
    else
      redirect_to root_path
    end
  end

  # GET /announcements/1/edit
  def edit
    if current_user.is_admin?
      @announcement = Announcement.find(params[:id])
    else
      redirect_to root_path
    end
  end

  # POST /announcements
  # POST /announcements.xml
  def create
    if current_user.is_admin?
      @announcement = current_user.announcements.build(params[:announcement])
  
      respond_to do |format|
        if @announcement.save
          format.html { redirect_to(@announcement, :notice => 'Announcement was successfully created.') }
          format.xml  { render :xml => @announcement, :status => :created, :location => @announcement }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @announcement.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to root_path
    end
  end

  # PUT /announcements/1
  # PUT /announcements/1.xml
  def update
    if current_user.is_admin?
      @announcement = Announcement.find(params[:id])
  
      respond_to do |format|
        if @announcement.update_attributes(params[:announcement])
          format.html { redirect_to(@announcement, :notice => 'Announcement was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @announcement.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.xml
  def destroy
    if current_user.is_admin?
      @announcement = Announcement.find(params[:id])
      @announcement.destroy
  
      respond_to do |format|
        format.html { redirect_to(announcements_url) }
        format.xml  { head :ok }
      end
    else
      redirect_to root_path
    end
  end
end
