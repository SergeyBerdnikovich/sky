class Changeschedule12 < ActiveRecord::Migration
  def up
  	rename_column :orders, :schedule_id, :schedule_plan_id
  end

  def down
  end
end
