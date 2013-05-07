class CreateTarifs < ActiveRecord::Migration
  def change
    create_table :tarifs do |t|
      t.float :price

      t.timestamps
    end
  end
end
