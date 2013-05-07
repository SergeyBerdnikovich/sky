class ProfilesController < ApplicationController
  def wizard1
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to orders_wizard2_path(:id => @profile.id), notice: 'Profile was successfully updated.' }
        # format.html { redirect_to orders_wizard3_path(:id => @profile.profilable.order.id), notice: 'Profile was successfully updated.' }

        format.json { render action: 'edit', status: :created, location: @profile }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
end
