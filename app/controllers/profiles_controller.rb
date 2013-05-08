class ProfilesController < ApplicationController
  def wizard1
    current_user.properties << Property.create!
    @profile = current_user.properties.first.profile
  end

  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        if @profile.profilable_type == 'Property' && params[:redirect_to] == 'wizard2'
          format.html { redirect_to orders_wizard2_path(:id => @profile.id), notice: 'Profile was successfully updated.' }
        else
          format.html { redirect_to profile_path(@profile), notice: 'Profile was successfully updated.' }
        end
        format.json { render action: 'edit', status: :created, location: @profile }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end
end
