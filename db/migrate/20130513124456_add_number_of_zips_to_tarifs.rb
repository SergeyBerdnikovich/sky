class AddNumberOfZipsToTarifs < ActiveRecord::Migration
  def change
    add_column :tarifs, :number_of_zips, :integer
  end
end
