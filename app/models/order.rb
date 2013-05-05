class Order < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :client_id, :plan_id, :schedule_id, :stat, :zip
end
