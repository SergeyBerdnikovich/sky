class ZipCode < ActiveRecord::Base
  attr_accessible :city, :lat, :long, :state, :zipcode

  has_and_belongs_to_many :vendor
  
end
