class CreateZipCodes < ActiveRecord::Migration
  def change
    create_table :zip_codes do |t|
      t.integer :zipcode
      t.string :city
      t.string :state
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
