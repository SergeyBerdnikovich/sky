class Vendor < ActiveRecord::Base
  attr_accessible :address, :email, :phone_number, :site_url, :tarif_id, :title

  belongs_to :tarif
  has_many :vendors_zips
end
