class Zip < ActiveRecord::Base
  attr_accessible :city, :state, :number

  has_and_belongs_to_many :vendors
end
