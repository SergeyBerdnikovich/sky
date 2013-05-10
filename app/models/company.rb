class Company < ActiveRecord::Base
  attr_accessible :fax, :fname, :lname, :profile_id

  belongs_to :profile
end
