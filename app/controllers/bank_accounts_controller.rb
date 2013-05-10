class BankAccountsController < ApplicationController
  def wizard2
    @bank_account = BankAccount.new(:vendor_id => current_user.vendor.id)
  end

  def create
    @bank_account = BankAccount.new(params[:bank_account])
    unless @bank_account.account_number == params[:re_enter_account_number]
      render :action => "wizard2"
    else
      respond_to do |format|
        if @bank_account.save
          format.html { redirect_to profiles_wizard3_path, notice: 'Order was successfully updated.'}
          format.json { render :json => @bank_account, :status => :created, :location => @order }
        else
          format.html { render :action => "new" }
          format.json { render :json => @bank_account.errors, :status => :unprocessable_entity }
        end
      end
    end
  end
end