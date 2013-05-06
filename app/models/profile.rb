class Profile < ActiveRecord::Base
  attr_accessible :name, :phone, :user_id

  belongs_to :user
  has_one :order, :dependent => :destroy

  after_create :create_order

  def create_order
    self.order = Order.create!
  end
end
