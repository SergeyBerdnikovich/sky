class Profile < ActiveRecord::Base
  attr_accessible :name,
                  :phone,
                  :prof_id,
                  :prof_type,
                  :address1,
                  :address2,
                  :city,
                  :state,
                  :email,
                  :zip,
                  :url,
                  :description,
                  :profilable_id,
                  :profilable_type,
                  :company_attributes

  belongs_to :profilable, polymorphic: true
  has_one :company

  accepts_nested_attributes_for :company,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
