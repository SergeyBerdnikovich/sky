class AdditionalService < ActiveRecord::Base
  attr_accessible :name
  belongs_to :additional_service_price
end
