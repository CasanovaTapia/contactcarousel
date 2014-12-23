class AddTimingToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :timing_id, :integer
    add_index :calls, :timing_id
  end
end
