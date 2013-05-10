class BankAccount < ActiveRecord::Base
  attr_accessible :account_number, :account_type, :name, :routing_number, :vendor_id

  belongs_to :vendor
end
