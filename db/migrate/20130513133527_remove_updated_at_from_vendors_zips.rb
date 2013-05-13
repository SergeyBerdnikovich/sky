class RemoveUpdatedAtFromVendorsZips < ActiveRecord::Migration
  def up
    remove_column :vendors_zips, :updated_at
  end

  def down
    add_column :vendors_zips, :updated_at, :string
  end
end
