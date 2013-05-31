class AdditionalService < ActiveRecord::Base
  attr_accessible :name
  has_many :vendors, :through => :additional_service_price
end
