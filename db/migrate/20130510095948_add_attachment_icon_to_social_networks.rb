class AddAttachmentIconToSocialNetworks < ActiveRecord::Migration
  def self.up
    change_table :social_networks do |t|
      t.attachment :icon
    end
  end

  def self.down
    drop_attached_file :social_networks, :icon
  end
end
