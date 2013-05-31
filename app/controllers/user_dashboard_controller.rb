class UserDashboardController < ApplicationController
  include IceCube
  def dashboard
    redirect_to root_path and return false unless current_user



    @properties = current_user.properties
  end

  def calendar_events
    # full_calendar will hit the index method with query parameters
    # 'start' and 'end' in order to filter the results for the
    # appropriate month/week/day.  It should be possiblt to change
    # this to be starts_at and ends_at to match rails conventions.
    # I'll eventually do that to make the demo a little cleaner.


    @orders = Order.all
    startdate = params[:start]
    enddate = params[:end]

    @events = []

    @orders.each{|order|
    schedule = Schedule.new(start = order.start_date) 
    schedule.add_recurrence_rule Rule.daily(order.schedule_plan.period).until(DateTime.strptime(enddate,'%s'))
     schedule.each_occurrence { |t| 
     temp_hash = {
      :id => order.id,    
      :title => "Lawn service by " + order.vendor.user.profile.name,
      :start => t,
      #:end => (self.start_date + 23.hours).rfc822,
      :allDay => 1,
      :recurring => false,
      :url => order_path(order)
      }
      @events.push(temp_hash)

       }
    
    }
    # @events = @events.after(params['start']) if (params['start'])
    # @events = @events.before(params['end']) if (params['end'])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.js  { render :json => @events }
    end
  end

  def calendar
    redirect_to root_path and return false unless current_user
    @events = []
    @orders = Order.all
    @orders.each{|order|
    schedule = Schedule.new(start = order.start_date) 
    schedule.add_recurrence_rule Rule.daily(order.schedule_plan.period)
    schedule.next_occurrences(10, Time.now).each { |t| 
     temp_hash = {
      :id => order.id,    
      :title => "Lawn service by " + order.vendor.user.profile.name,
      :start => t,
      #:end => (self.start_date + 23.hours).rfc822,
      :allDay => 1,
      :recurring => false,
      :url => order_path(order)
      }
      @events.push(temp_hash)

       }
    
    }
  end
end
