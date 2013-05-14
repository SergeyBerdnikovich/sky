class UserWizardsController < ApplicationController
  before_filter :check_user, :except => [:step0]
  before_filter :check_property, :only => [:step2, :step3, :step4, :step5, :step6]

  def step0
    sign_out
  end

  def step2
    @profile = current_user.properties.first.profile
  end

  def step3
    @profile = current_user.properties.first.profile
    @vendors_zip = Zip.where(:number => @profile.zip).first
    @vendors = @vendors_zip.try(:vendors) || []
    @order = @profile.profilable.orders.first || @profile.profilable.orders.build
  end

  def step4
    @order = current_user.properties.first.orders.first
  end

  def step5
    @order = current_user.properties.first.orders.first
  end

  def step6
    @order = current_user.properties.first.orders.first
  end

  def handler
    respond_to do |format|
      if params[:step] == '2'
        @profile = current_user.properties.first.profile
        if @profile.update_attributes(params[:profile])
          format.html { redirect_to user_wizards_step3_path }
        else
          format.html { render :action => "step2" }
        end
      elsif params[:step] == '3'
        if current_user.properties.first.orders.first && current_user.properties.first.orders.first.update_attributes(params[:order])
          format.html { redirect_to user_wizards_step4_path }
        else
          @order = Order.new(params[:order])
          if @order.save
            format.html { redirect_to user_wizards_step4_path }
          else
            format.html { render :action => "step3" }
          end
        end
      elsif params[:step] == '4'
        @order = current_user.properties.first.orders.first
        if @order.update_attributes(params[:order])
          format.html { redirect_to user_wizards_step5_path }
        else
          format.html { render :action => "step4" }
        end
      elsif params[:step] == '5'
        card_type = params[:card_type]
        card_number = params[:card_number]
        card_date1 = params[:card_date1]
        card_date2 = params[:card_date2]
        veryfication_number = params[:veryfication_number]
        card_first_name = params[:card_first_name]
        card_last_name = params[:card_last_name]
        contact_number = params[:contact_number]
        address = params[:address]
        country = params[:country]
        city = params[:city]
        state = params[:state]
        zip = params[:zip]

        format.html { redirect_to user_wizards_step6_path }
      else
        format.html { redirect_to root_path, notice: 'Error' }
      end
    end
  end

  private

  def check_user
    redirect_to root_path unless current_user
  end

  def check_property
    redirect_to root_path unless current_user && current_user.properties.first
  end
end