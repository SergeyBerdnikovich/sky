class Order < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :property
  belongs_to :vendor

  attr_accessible :property_id, :vendor_id, :start_date, :size, :comment, :schedule_id
end
