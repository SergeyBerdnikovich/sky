class Vendor < ActiveRecord::Base
  attr_accessible :address, :email, :phone_number, :site_url, :tarif_id, :title, :user_id

  belongs_to :tarif
  belongs_to :user
  has_many :vendors_zips
end
