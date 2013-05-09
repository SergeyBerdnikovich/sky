class AddScheduleIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :schedule_id, :integer
  end
end
