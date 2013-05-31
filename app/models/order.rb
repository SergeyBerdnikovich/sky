class Order < ActiveRecord::Base
	
#	  scope :before, lambda {|end_time| {:conditions => ["ends_at < ?", Event.format_date(end_time)] }}
#  scope :after, lambda {|start_time| {:conditions => ["starts_at > ?", Event.format_date(start_time)] }}

  belongs_to :schedule_plan
  belongs_to :property
  belongs_to :vendor

  attr_accessible :property_id, :vendor_id, :start_date, :size, :comment, :schedule_plan_id

   def as_json(options = {})
    {
      :id => self.id,    
      :title => "Lawn service by " + self.vendor.user.profile.name,
      :start => self.start_date.rfc822,
      #:end => (self.start_date + 23.hours).rfc822,
      :allDay => 1,
      :recurring => false,
      :url => ""
    }
    
  end


end
