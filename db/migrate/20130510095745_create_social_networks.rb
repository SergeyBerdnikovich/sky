class CreateSocialNetworks < ActiveRecord::Migration
  def change
    create_table :social_networks do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
