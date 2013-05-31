class AddProfileifToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :profile_id, :integer
  end
end
