class Plan < ActiveRecord::Base
  attr_accessible :features, :name, :price, :zips
    has_many :vendor
end
