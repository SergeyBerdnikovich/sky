class Tarif < ActiveRecord::Base
  attr_accessible :price

  has_many :vendors
end
