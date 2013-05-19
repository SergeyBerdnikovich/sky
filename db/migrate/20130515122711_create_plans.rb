class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.float :price
      t.text :features
      t.integer :zips

      t.timestamps
    end
  end
end
