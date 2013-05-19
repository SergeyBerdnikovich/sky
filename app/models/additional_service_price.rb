class AdditionalServicePrice < ActiveRecord::Base
  attr_accessible :additional_service_id, :flat, :per_sq, :vendoir_if
  belongs_to :vendor
  has_one :additional_service_price
end
