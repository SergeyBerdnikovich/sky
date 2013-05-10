class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :fname
      t.string :lname
      t.integer :fax
      t.integer :profile_id

      t.timestamps
    end
  end
end
