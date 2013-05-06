class Order < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :profile_id, :plan_id, :stat, :zip

  has_one :schedule
  belongs_to :plan
  belongs_to :profile
end
