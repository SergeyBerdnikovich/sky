class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :size_from
      t.integer :size_to
      t.float :per_sq
      t.float :flate

      t.timestamps
    end
  end
end
