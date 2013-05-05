class Profile < ActiveRecord::Base
  attr_accessible :name, :phone, :user_id
  belongs_to :user
end
