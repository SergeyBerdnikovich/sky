class OrdersController < ApplicationController
  def edit
    @order = Order.find(params[:id])
    @vendors_zip = Zip.where(:number => @order.property.profile.zip).first
    @vendors = @vendors_zip.try(:vendors) || []
    @schedule = @order.schedule || @order.build_schedule
  end

  def new
    @order = Order.new(:property_id => params[:id])
    @vendors_zip = Zip.where(:number => @order.property.profile.zip).first
    @vendors = @vendors_zip.try(:vendors) || []
    @schedule = @order.build_schedule
  end

  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        if params[:redirect_to] == 'order'
          format.html { redirect_to order_path(@order), notice: 'Order was successfully updated.'}
        elsif params[:redirect_to] == 'wizard2'
          format.html { redirect_to orders_wizard2_path(@order), notice: 'Order was successfully updated.'}
        elsif params[:redirect_to] == 'wizard3'
          format.html { redirect_to orders_wizard3_path(:id => @order.id), notice: 'Order was successfully updated.'}
        else
          redirect_to root_path
        end
        format.json  { render :json => @order,
                      :status => :created, :location => @order }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        if params[:redirect_to] == 'order'
          format.html { redirect_to order_path(@order), notice: 'Order was successfully updated.'}
        elsif params[:redirect_to] == 'wizard4'
          format.html { redirect_to orders_wizard4_path(:id => @order.id), notice: 'Order was successfully updated.'}
        else
          format.html { redirect_to root_path }
        end
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def wizard2
    @profile = Profile.find(params[:id])
    @vendors_zip = Zip.where(:number => @profile.zip).first
    @vendors = @vendors_zip.try(:vendors) || []
    @order = @profile.profilable.orders.build
  end

  def wizard3
    @order = Order.find(params[:id])
  end

  def wizard4
    @order = Order.find(params[:id])
  end

  def wizard5
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

    @order = Order.find(params[:id])
    # save data

    # send confirmation email
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.where(:property_id => params[:id])
  end

  def my_orders
    @orders = []
    current_user.properties.each do |property|
      property.orders.each do |order|
        @orders << order
      end
    end
    @orders
  end
end
