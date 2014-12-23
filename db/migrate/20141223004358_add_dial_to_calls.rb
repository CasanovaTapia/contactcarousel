class AddDialToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :dial_id, :integer
    add_index :calls, :dial_id
  end
end
