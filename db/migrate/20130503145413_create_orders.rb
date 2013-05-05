class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.string :address1
      t.string :address2
      t.string :city
      t.string :stat
      t.integer :zip
      t.integer :plan_id
      t.integer :schedule_id

      t.timestamps
    end
  end
end
