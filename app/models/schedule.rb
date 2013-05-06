class Schedule < ActiveRecord::Base
  attr_accessible :name, :period, :order_id

  belongs_to :order
end
