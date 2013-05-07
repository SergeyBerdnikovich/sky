class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :title
      t.string :address
      t.string :phone_number
      t.string :email
      t.string :site_url
      t.integer :tarif_id

      t.timestamps
    end
  end
end
