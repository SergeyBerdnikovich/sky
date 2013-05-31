class PropertiesController < ApplicationController
  def index
    @properties = Property.where(:user_id => current_user.id)
  end

  def new
    @property = Property.new(:user_id => current_user.id)
    @profile = Profile.new()
  end

  def create
    @profile = Profile.new(params[:property][:profile])
    params[:property].delete(:profile)
    @property = Property.new(params[:property])

    respond_to do |format|
      if @property.save
        @property.profile = @profile
        format.html { redirect_to property_path(@property), notice: 'Property was successfully updated.'}
        format.json { render :json => @property, :status => :created, :location => @property }
      else
        format.html { render :action => "new" }
        format.json { render :json => @property.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def destroy
    @property = Property.find(params[:id])

  end

  def destroy
    @property = Property.find(params[:id])
    
    
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_path()  }
      format.json { head :no_content }
    end
  end


  def edit
    @property = Property.find(params[:id])
    @profile = @property.profile
  end

  def update
    @profile = Profile.new(params[:property][:profile])
    params[:property].delete(:profile)
    @property = Property.find(params[:id])

    respond_to do |format|
      if @property.update_attributes(params[:property])
         @property.profile = @profile
        format.html { redirect_to property_path(@property), notice: 'Property was successfully updated.' }
        format.json { render action: 'edit', status: :created, location: @property }
      else
        format.html { render action: 'edit' }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end
end
