class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.integer :user_id
      t.integer :tarif_id

      t.timestamps
    end
  end
end
