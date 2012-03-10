class AccountsController < ApplicationController
  
  include Databasedotcom::Rails::Controller
  
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @channel }
    end
  end
  
  def create
    @account = Account.create(params[:account])

    respond_to do |format|
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
      end
  end
  
  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @account = Account.find(params[:id])
    @account.delete

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
    end
  end
end
