class VendorsZip < ActiveRecord::Base
  attr_accessible :vendor_id, :zip

  belongs_to :vendor
end
