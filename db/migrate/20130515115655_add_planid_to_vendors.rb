class AddPlanidToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :plan_id, :integer
  end
end
