class CreateWorkingHours < ActiveRecord::Migration
  def change
    create_table :working_hours do |t|
      t.integer :day
      t.integer :open
      t.integer :close
      t.integer :vendor_id

      t.timestamps
    end
  end
end
