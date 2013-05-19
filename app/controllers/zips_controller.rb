class ZipsController < ApplicationController
  before_filter :check_user
  # GET /zips
  # GET /zips.json
  def check_user

    redirect_to root_path  if current_user == nil
    if current_user 
    redirect_to root_path  if current_user.vendor == false
    end
  end

  def index
    @zips = current_user.vendor.zips

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @zips }
    end
  end

  # GET /zips/new
  # GET /zips/new.json
  def new
    @zips = Zip.all
    @user_zips = current_user.vendor.zips
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @zip }
    end
  end

  # GET /zips/1/edit
  # POST /zips
  # POST /zips.json
  def create
    @zip =  Zip.find(params[:id])

    respond_to do |format|
      if current_user.vendor.zips << @zip
        format.html { redirect_to @zip, notice: 'Zip was successfully created.' }
        format.json { render json: @zip, status: :created, location: @zip }
      else
        format.html { render action: "new" }
        format.json { render json: @zip.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /zips/1
  # DELETE /zips/1.json
  def destroy
    @zip = Zip.find(params[:id])
    current_user.vendor.zips.find(@zip).destroy

    respond_to do |format|
      format.html { redirect_to zips_url }
      format.json { head :no_content }
    end
  end
end
