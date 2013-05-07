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
                  :profilable_type

  belongs_to :profilable, polymorphic: true
end
