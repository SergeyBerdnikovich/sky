class Order < ActiveRecord::Base
  attr_accessible :property_id, :vendor_id, :start_date, :size, :comment

  has_one :schedule
  belongs_to :property
  belongs_to :vendor
end
