class VendorsController < ApplicationController
  def wizard5
    @vendor = current_user.vendor
    @zips = Zip.all
    @tarifs = Tarif.all
  end

  def wizard6
  end

  def update
    @vendor = current_user.vendor
    @tarif = Tarif.where("number_of_zips >= ?", params[:zip_ids].size).first
    params[:zip_ids].each do |zip_id|
      @vendor.zips << Zip.find(zip_id)
    end
    respond_to do |format|
      if @tarif && @vendor.update_attribute(:tarif_id, @tarif.id)
        format.html { redirect_to vendors_wizard6_path, notice: 'Vendor was successfully updated.'}
        format.json { render action: 'show', status: :created, location: @vendor }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  def preview
  end
end