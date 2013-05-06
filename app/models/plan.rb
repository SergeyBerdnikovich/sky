class Plan < ActiveRecord::Base
  attr_accessible :des, :name, :price

  has_many :orders
end
