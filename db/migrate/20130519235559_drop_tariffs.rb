class DropTariffs < ActiveRecord::Migration
  def up
  	drop_table :tarifs
  end

  def down
  end
end
