class Vendor < ActiveRecord::Base
  attr_accessible :address, :email, :phone_number, :site_url, :plan_id, :tarif_id, :title, :user_id

  belongs_to :user
  belongs_to :plan
  has_many :tarif
  has_one :bank_account
  has_and_belongs_to_many :zips
end
