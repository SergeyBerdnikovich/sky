class Vendor < ActiveRecord::Base
  attr_accessible :address, :email, :phone_number, :site_url, :tarif_id, :title, :user_id

  belongs_to :tarif
  belongs_to :user
  has_one :bank_account
  has_and_belongs_to_many :zips
end
