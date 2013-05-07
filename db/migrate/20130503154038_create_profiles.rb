class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :profilable_id
      t.string :profilable_type
      t.string :name
      t.string :description
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :phone
      t.string :email
      t.string :url
      t.integer :zip

      t.timestamps
    end
  end
end
