class ChannelsController < ApplicationController

  include Databasedotcom::Rails::Controller
      
  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel__c.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @channels }
    end
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
    @channel = Channel__c.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @channel }
    end
  end

  # GET /channels/new
  # GET /channels/new.json
  def new
    @channel = Channel__c.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @channel }
    end
  end

  # GET /channels/1/edit
  def edit
    @channel = Channel__c.find(params[:id])
  end

  # POST /channels
  # POST /channels.json
  def create
    @channel = Channel__c.create(params[:channel])

    respond_to do |format|
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render json: @channel, status: :created, location: @channel }
      end
  end

  # PUT /channels/1
  # PUT /channels/1.json
  def update
    @channel = Channel__c.find(params[:id])

    respond_to do |format|
      if @channel.update_attributes(params[:channel])
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel = Channel__c.find(params[:id])
    @channel.destroy

    respond_to do |format|
      format.html { redirect_to channels_url }
      format.json { head :no_content }
    end
  end
end
