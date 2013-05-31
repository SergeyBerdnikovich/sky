class Rename < ActiveRecord::Migration
  def up
  	rename_table :schedules, :schedule_plans
  end

  def down
  end
end
