class CreateZips < ActiveRecord::Migration
  def change
    create_table :zips do |t|
      t.string :state
      t.string :city
      t.integer :number

      t.timestamps
    end
  end
end
