class OrdersController < ApplicationController
  def edit
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new

    respond_to do |format|
      format.html  # new.html.erb
      format.json  { render :json => @order }
    end
  end

  def create
    @order = Order.new(params[:post])

    respond_to do |format|
      if @order.save
        format.html  { redirect_to orders_wizard2_path(@order), notice: 'Order was successfully updated.'}
        format.json  { render :json => @order,
                      :status => :created, :location => @order }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @order.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def wizard4

  end


  def wizard2
    @profile = Profile.find(params[:id])
    @vendors_zips = VendorsZip.where(:zip => @profile.zip)
    @order = @profile.profilable.orders.first
  end

  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to schedules_wizard3_path(:id => @order.id), notice: 'Order was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @order = Order.find(params[:id])
  end
end
