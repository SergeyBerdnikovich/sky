class CreateAdditionalServices < ActiveRecord::Migration
  def change
    create_table :additional_services do |t|
      t.text :name

      t.timestamps
    end
  end
end
