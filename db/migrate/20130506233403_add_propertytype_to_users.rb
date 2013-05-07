class AddPropertytypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :property_type_id, :integer
  end
end
