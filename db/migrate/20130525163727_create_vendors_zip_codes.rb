class CreateVendorsZipCodes < ActiveRecord::Migration
  def change
    create_table :vendors_zip_codes do |t|
      t.integer :vendor_id
      t.integer :zip_code_id

      t.timestamps
    end
  end
end
