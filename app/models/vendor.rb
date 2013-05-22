class Vendor < ActiveRecord::Base
  attr_accessible :address, :email, :phone_number, :site_url, :plan_id, :tarif_id, :title, :user_id

  belongs_to :user
  belongs_to :plan
  belongs_to :tarif
  has_many :working_hour
  has_many :price
  has_one :bank_account
  has_many :additional_service_price
  has_many :additional_service, :through => :additional_service_price
  has_and_belongs_to_many :zips
end
