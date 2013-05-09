class Schedule < ActiveRecord::Base
  attr_accessible :name, :period

  has_many :order
end
