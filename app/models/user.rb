class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable#, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :account_type_id, :property_type_id, :redirect
  # attr_accessible :title, :body
  belongs_to :account_type
  has_one :profile, as: :profilable
  has_and_belongs_to_many :roles
  has_many :properties, :dependent => :destroy
  has_one :vendor

  after_create :create_profile
  after_create :create_property
  after_create :create_vendor

  private

  def create_profile
    self.profile = Profile.create!
  end

  def create_property
    self.properties << Property.create! if self.redirect == 'residential'
  end

  def create_vendor
    self.vendor = Vendor.create! if self.redirect == 'vendor'
  end
end
