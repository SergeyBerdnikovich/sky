class AddVendoridToTarifs < ActiveRecord::Migration
  def change
    add_column :tarifs, :vendor_id, :integer
  end
end
