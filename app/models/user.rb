class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable#, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :account_type_id
  # attr_accessible :title, :body
  belongs_to :account_type
  has_one :profile, :dependent => :destroy
  has_and_belongs_to_many :roles

  after_create :create_profile

  def create_profile
    self.profile = Profile.create!
  end

end
