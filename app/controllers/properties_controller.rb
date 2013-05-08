class PropertiesController < ApplicationController
  def index
    @properties = Property.where(:user_id => current_user.id)
  end

  def new
    @property = Property.new(:user_id => current_user.id)
  end

  def create
    @property = Property.new(params[:property])

    respond_to do |format|
      if @property.save
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
end
