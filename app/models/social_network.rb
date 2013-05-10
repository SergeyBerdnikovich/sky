class SocialNetwork < ActiveRecord::Base
  attr_accessible :link, :name, :icon

  has_attached_file :icon, :styles => { :social_icon => "20x20>",
                                        :thumb => "100x100>" },
                           :default_url => "/images/:style/missing.png",
                           :url  => "/images/social_icons/:id/:style/:basename.:extension",
                           :path => ":rails_root/public/images/social_icons/:id/:style/:basename.:extension"

  validates_attachment_presence :icon
  validates_attachment_size :icon, :less_than => 2.megabytes
  validates_attachment_content_type :icon,
                                    :content_type => ['image/jpg', 'image/jpeg', 'image/gif', 'image/png']
end
