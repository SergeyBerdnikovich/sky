class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :property_id
      t.integer :vendor_id
      t.datetime :start_date
      t.integer :size
      t.text :comment

      t.timestamps
    end
  end
end
