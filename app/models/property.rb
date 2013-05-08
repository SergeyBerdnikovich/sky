class Property < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many :orders
  has_one :profile, as: :profilable

  after_create :create_order
  after_create :create_profile

  def create_order
    self.orders << Order.create!
  end

  def create_profile
    self.profile = Profile.create!
  end
end
