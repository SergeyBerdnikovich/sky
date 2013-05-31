class SchedulePlan < ActiveRecord::Base
  attr_accessible :name, :period

  has_many :order
end
