class Property < ActiveRecord::Base
  attr_accessible :user_id, :size, :profile_attributes

  belongs_to :user
  #belongs_to :profile
  has_many :orders
  has_one :profile, as: :profilable

  after_create :create_profile
#  accepts_nested_attributes_for :profile

  def create_profile
   # self.profile = Profile.create!
  end
end
