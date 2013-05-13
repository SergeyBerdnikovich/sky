class RemoveCreatedAtFromVendorsZips < ActiveRecord::Migration
  def up
    remove_column :vendors_zips, :created_at
  end

  def down
    add_column :vendors_zips, :created_at, :string
  end
end
