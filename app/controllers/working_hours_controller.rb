class WorkingHoursController < ApplicationController
  # GET /working_hours
  # GET /working_hours.json
  def index
    @working_hours = WorkingHour.where('vendor_id = ?', current_user.vendor.id) 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @working_hours }
    end
  end

  # GET /working_hours/1
  # GET /working_hours/1.json
  def show
    @working_hour = WorkingHour.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @working_hour }
    end
  end

  # GET /working_hours/new
  # GET /working_hours/new.json
  def new
    @working_hour = WorkingHour.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @working_hour }
    end
  end

  # GET /working_hours/1/edit
  def edit
    @working_hour = WorkingHour.find(params[:id])
    redirect_to working_hours_path() unless @working_hour.vendor_id == current_user.vendor.id
  end

  # POST /working_hours
  # POST /working_hours.json
  def create
    @working_hour = WorkingHour.new(params[:working_hour])
    @working_hour.vendor_id = current_user.vendor.id
    respond_to do |format|
      if @working_hour.save
        format.html { redirect_to @working_hour, notice: 'Working hour was successfully created.' }
        format.json { render json: @working_hour, status: :created, location: @working_hour }
      else
        format.html { render action: "new" }
        format.json { render json: @working_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /working_hours/1
  # PUT /working_hours/1.json
  def update
    @working_hour = WorkingHour.find(params[:id])
    redirect_to working_hours_path() unless @working_hour.vendor_id == current_user.vendor.id
    respond_to do |format|
      if @working_hour.update_attributes(params[:working_hour])
        format.html { redirect_to @working_hour, notice: 'Working hour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @working_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /working_hours/1
  # DELETE /working_hours/1.json
  def destroy
    @working_hour = WorkingHour.find(params[:id])
    redirect_to working_hours_path() and return false unless @working_hour.vendor_id == current_user.vendor.id
    
    @working_hour.destroy

    respond_to do |format|
      format.html { redirect_to working_hours_url }
      format.json { head :no_content }
    end
  end
end
