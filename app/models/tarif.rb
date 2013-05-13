class Tarif < ActiveRecord::Base
  attr_accessible :price, :number_of_zips

  has_many :vendors
end
