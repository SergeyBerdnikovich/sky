class CreateAdditionalServicePrices < ActiveRecord::Migration
  def change
    create_table :additional_service_prices do |t|
      t.integer :additional_service_id
      t.integer :vendoir_if
      t.float :per_sq
      t.float :flat

      t.timestamps
    end
  end
end
