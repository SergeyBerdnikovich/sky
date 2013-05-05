class CreateProperyTypes < ActiveRecord::Migration
  def change
    create_table :propery_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
