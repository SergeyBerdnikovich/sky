class BankAccountsController < ApplicationController
  # GET /bank_accounts
  # GET /bank_accounts.json
  def index

    @bank_account = current_user.vendor.bank_account
    if @bank_account
      redirect_to bank_account_path(@bank_account)

    else
      redirect_to new_bank_account_path()
    end
  end

  # GET /bank_accounts/1
  # GET /bank_accounts/1.json
  def show
    @bank_account = BankAccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bank_account }
    end
  end

  # GET /bank_accounts/new
  # GET /bank_accounts/new.json
  def new
    @bank_account = BankAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bank_account }
    end
  end

  # GET /bank_accounts/1/edit
  def edit
    @bank_account = BankAccount.find(params[:id])
  end

  # POST /bank_accounts
  # POST /bank_accounts.json
  def create
    @bank_account = BankAccount.new(params[:bank_account])
    @bank_account.vendor_id = current_user.vendor.id
    respond_to do |format|
      if @bank_account.save
        format.html { redirect_to @bank_account, notice: 'Bank account was successfully created.' }
        format.json { render json: @bank_account, status: :created, location: @bank_account }
      else
        format.html { render action: "new" }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bank_accounts/1
  # PUT /bank_accounts/1.json
  def update
    @bank_account = BankAccount.find(params[:id])
    params[:bank_account][:vendor_id] = current_user.vendor.id
    respond_to do |format|
      if @bank_account.update_attributes(params[:bank_account])
        format.html { redirect_to @bank_account, notice: 'Bank account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bank_account.errors, status: :unprocessable_entity }
      end
    end
  end


end
