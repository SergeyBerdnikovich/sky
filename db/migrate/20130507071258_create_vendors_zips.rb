class CreateVendorsZips < ActiveRecord::Migration
  def change
    create_table :vendors_zips do |t|
      t.integer :vendor_id
      t.integer :zip

      t.timestamps
    end
  end
end
