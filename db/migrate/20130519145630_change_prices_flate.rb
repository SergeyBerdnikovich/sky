class ChangePricesFlate < ActiveRecord::Migration
  def up
  	rename_column :prices, :flate, :flat
  end

  def down
  end
end
