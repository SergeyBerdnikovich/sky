class Price < ActiveRecord::Base
  attr_accessible :flat, :per_sq, :size_from, :size_to, :vendor_id
  belongs_to :vendor
end
