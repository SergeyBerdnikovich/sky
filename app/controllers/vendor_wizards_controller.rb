class VendorWizardsController < ApplicationController
  before_filter :check_user, :except => [:step0]

  def step0
    sign_out
  end

  def step2
    @plans = Plan.all()
    session[:zip] = params[:zip]
  end

  def step3
   current_zip =  ZipCode.where('zipcode = ?',session[:zip]).first
   @zips = ZipCode.where('city = ? and state = ?',current_zip.city, current_zip.state)
   @vendor = current_user.vendor
  end

  def step4
   @vendor = current_user.vendor
  end

  def step5
  end

  def step6
    @vendor = current_user.vendor
    @zips = Zip.all
    @tarifs = Tarif.all
  end

  def step7
  end

  def handler
    @vendor = current_user.vendor
    respond_to do |format|
      if params[:step] == '2'
        
        if params['plan_id']
        @vendor.update_attribute(:plan_id, params['plan_id'])
        format.html { redirect_to vendor_wizards_step3_path }
        else
        format.html { redirect_to vendor_wizards_step2_path, notice: 'Please select your plan'}          
        end
        
      elsif params[:step] == '3'
        zips = params['zips'].count
        if zips <= @vendor.plan.zips
          @vendor.zip_code.destroy_all
          params['zips'].each do |z|
                 @vendor.zip_code << ZipCode.find(z)     
          end
        format.html { redirect_to vendor_wizards_step4_path }
        else
        format.html { redirect_to vendor_wizards_step3_path(:zips => params[:zips]), notice: "Please select appropriate number of zip codes. You may select #{@vendor.plan.zips} codes but selected #{zips} zip codes "}          
        end

      elsif params[:step] == '4'

        if current_user.profile.company && current_user.profile.company.update_attributes(params[:company])
        else
          current_user.profile.company = Company.create!(params[:company])
        end
        current_user.profile.update_attributes(params[:profile])
        format.html { redirect_to vendor_wizards_step5_path }

      elsif params[:step] == '5'
        format.html { redirect_to vendor_wizards_step6_path }
      elsif params[:step] == '6'
        @vendor = current_user.vendor
        @tarif = Tarif.where("number_of_zips >= ?", params[:zip_ids].try(:size)).first
        @vendor.zips = []
        if @tarif && @vendor.update_attribute(:tarif_id, @tarif.id)
          params[:zip_ids].each do |zip_id|
            @vendor.zips << Zip.find(zip_id)
          end
          format.html { redirect_to vendor_wizards_step7_path }
        else
          format.html { redirect_to vendor_wizards_step6_path }
        end
      else
        raise "Unkown step - #{params['step']}"
        format.html { redirect_to root_path, notice: 'Error' }
      end
    end
  end

  private

  def check_user
    redirect_to root_path unless current_user
  end
end