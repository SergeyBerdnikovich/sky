class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.string :account_type
      t.string :name
      t.string :routing_number
      t.string :account_number
      t.integer :vendor_id

      t.timestamps
    end
  end
end
