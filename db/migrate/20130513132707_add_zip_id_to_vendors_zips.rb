class AddZipIdToVendorsZips < ActiveRecord::Migration
  def change
    add_column :vendors_zips, :zip_id, :integer
  end
end
