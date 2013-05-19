class WorkingHour < ActiveRecord::Base
  attr_accessible :close, :day, :open, :vendor_id
  belongs_to :vendor
end
