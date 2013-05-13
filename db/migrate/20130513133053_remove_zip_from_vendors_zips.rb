class RemoveZipFromVendorsZips < ActiveRecord::Migration
  def up
    remove_column :vendors_zips, :zip
  end

  def down
    add_column :vendors_zips, :zip, :integer
  end
end
