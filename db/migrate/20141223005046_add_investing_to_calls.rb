class AddInvestingToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :investing_id, :integer
    add_index :calls, :investing_id
  end
end
