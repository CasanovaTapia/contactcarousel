class AddMotivatorToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :motivator_id, :integer
    add_index :calls, :motivator_id
  end
end
