class SchedulesController < ApplicationController
  def wizard3
    @order = Order.find(params[:id])
    @schedule = Schedule.new(:order_id => @order.id)
  end

  def create
    @schedule = Schedule.new(params[:schedule])

    respond_to do |format|
      if @schedule.save
        format.html  { redirect_to orders_wizard4_path(:id => @schedule.order.id), notice: 'Schedule was successfully updated.'}
        format.json  { render :json => @schedule,
                      :status => :created, :location => @schedule }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @schedule.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
end
