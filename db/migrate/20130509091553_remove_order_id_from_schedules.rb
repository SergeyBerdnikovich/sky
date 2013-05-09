class RemoveOrderIdFromSchedules < ActiveRecord::Migration
  def up
    remove_column :schedules, :order_id
  end

  def down
    add_column :schedules, :order_id, :integer
  end
end
