class VendorWizardsController < ApplicationController
  def step0
    sign_out
  end

  def step2
  end

  def step3
    @bank_account = current_user.vendor.bank_account || current_user.vendor.build_bank_account
  end

  def step4
    @profile = current_user.profile
    @profile.company ? @company = @profile.company : @company = @profile.build_company
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
    respond_to do |format|
      if params[:step] == '2'
        format.html { redirect_to vendor_wizards_step3_path }
      elsif params[:step] == '3'
        if current_user.vendor.bank_account
          if current_user.vendor.bank_account.account_number != params[:re_enter_account_number]
            format.html { redirect_to vendor_wizards_step3_path, notice: 'Check account number and re enter account number...' }
          else
            current_user.vendor.bank_account.update_attributes(params[:bank_account])
            format.html { redirect_to vendor_wizards_step4_path, notice: 'Order was successfully updated.'}
          end
        else
          @bank_account = BankAccount.new(params[:bank_account])
          unless @bank_account.account_number == params[:re_enter_account_number]
            format.html { render :action => "step3", notice: 'Check account number and re enter account number...' }
          else
            if @bank_account.save
              format.html { redirect_to vendor_wizards_step4_path, notice: 'Order was successfully updated.'}
            else
              format.html { render :action => "step3", notice: 'Save error...' }
            end
          end
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
        @tarif = Tarif.where("number_of_zips >= ?", params[:zip_ids].size).first
        @vendor.zips = []
        params[:zip_ids].each do |zip_id|
          @vendor.zips << Zip.find(zip_id)
        end
        if @tarif && @vendor.update_attribute(:tarif_id, @tarif.id)
          format.html { redirect_to vendor_wizards_step7_path }
        else
          format.html { render :action => "step6" }
        end
      else
        format.html { redirect_to root_path, notice: 'Error' }
      end
    end
  end
end